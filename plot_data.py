import sys
sys.path.append('~/src/picongpu/lib/python/picongpu/extra/plugins/data/')
sys.path.append('~/.local/bin/')
sys.path.append('~/.local/lib/python3.10/site-packages')
import os
import h5py
import re
import matplotlib.pyplot as plt
import numpy as np
import glob
import cv2
from PIL import Image, ImageSequence
from pprint import pprint
import warnings

#from picongpu.extra.plugins.data import PhaseSpaceData
#from picongpu.extra.plugins.plot_mpl import PhaseSpaceMPL

warnings.filterwarnings("ignore", category=RuntimeWarning)


class EnergyPlot:
    def __init__(self, data_folder ):
        self.data_folder = data_folder
        
    def load_energy_data(self, file_name):
        return np.loadtxt(self.data_folder + file_name)[:, 0:2]
    
    def calculate_total_energy(self, e_sum_ene, fields_sum_ene):
        tot_sum_ene = e_sum_ene[:, 1] + fields_sum_ene[:, 1]
        return abs(1 - tot_sum_ene / tot_sum_ene[1])
    
    def plot_energy(self):
        e_sum_ene = self.load_energy_data("e_energy_all.dat")
        fields_sum_ene = self.load_energy_data("fields_energy.dat")[:len(e_sum_ene)]
        
        tot_sum_ene_delta = self.calculate_total_energy(e_sum_ene, fields_sum_ene)
        
        plt.figure()
        plt.subplot(221)
        plt.yscale('log')
        plt.plot(e_sum_ene[:, 0], e_sum_ene[:, 1], label="Ek_e (joule)")
        plt.legend(loc='best')

        plt.subplot(222)
        plt.yscale('log')
        plt.plot(fields_sum_ene[:, 0], fields_sum_ene[:, 1], label="E_w (joule)")
        plt.legend(loc='best')

        plt.subplot(212)
        plt.yscale('log')
        plt.plot(e_sum_ene[:, 0], tot_sum_ene_delta, label="$\Delta$E_tot_re, max={:.6e}".format(np.max(tot_sum_ene_delta)))
        plt.ylabel('normalized $\Delta$E_tot', fontsize=12,fontweight='bold')
        plt.xlabel('time steps', fontsize=12,fontweight='bold')
        plt.legend(loc='lower left')

        savefigname = self.data_folder + "/energy_time.jpg"
        print(savefigname)
        plt.savefig(savefigname, dpi=720, bbox_inches='tight', pil_kwargs={"quality": 95} )
        plt.show()
        plt.close()


class HDF5Plot:
    def __init__(self, data_folder):
        self.data_folder = data_folder
        
    def read_hdf5_file_ps(self, file_path, tstep):
        with h5py.File(file_path, 'r') as file:
            dataset = file['/data/' + tstep + '/meshes/e_all_xpx']
            return dataset[:].T

    def read_hdf5_file_ex(self, file_path, tstep):
        with h5py.File(file_path, 'r') as file:
            dataset = file['/data/' + tstep + '/fields/E/x']
            return dataset[:].T

    def plot_ex_fft(self,wmax,kmax,nt_init):
        h5_files = sorted(glob.glob( self.data_folder + "*.h5" ))
        tmp1 = self.read_hdf5_file_ex(h5_files[0], '0')[:,1]

        ex1 = np.zeros((len(tmp1), len(h5_files)))
        idx1 = 0
        for data_path in h5_files:
            t1 = re.search(r'(?<=_)\d+(?=\.h5)', data_path).group()
            t11 = str(int(t1))
            ex1[:,idx1] = np.sum( self.read_hdf5_file_ex(data_path, t11)[:,:] , axis=1)
            idx1 += 1

        ex2=ex1[:,nt_init:]
        fft_result = np.fft.fft2(ex2)
        fft_result = np.fft.fftshift(fft_result)
        psd = np.abs(fft_result) ** 2 / (ex2.shape[0] * ex2.shape[1])
        psd = psd[:, ex2.shape[1]//2:]

        print('ex1 size = ' + str(ex1.shape))
        print('ex2 size = ' + str(ex2.shape))
        plt.figure(figsize=(4, 3))
        plt.subplot(121)
        plt.imshow(ex1.T, extent=[0, 1, 0, 1], interpolation='bilinear', aspect=2, origin='lower', cmap='jet')
        plt.ylabel('time', fontsize=12,fontweight='bold')
        plt.xlabel('x', fontsize=12,fontweight='bold')
        plt.title('Ex x - t history', fontsize=12,fontweight='bold')

        plt.subplot(222)
        plt.imshow(np.fliplr(np.log(psd).T), extent=[-1, 1, 0, wmax], interpolation='bilinear', aspect=2*kmax/wmax, origin='lower', cmap='jet')
        plt.ylabel('$\omega/\omega_{pe}$', fontsize=12,fontweight='bold')
        plt.xlabel('wave number k', fontsize=12,fontweight='bold')
        plt.title('dispersion diagram', fontsize=12,fontweight='bold')
        plt.xlim(-kmax,kmax)
        plt.ylim(0,wmax)

        savefigname = os.path.join(self.data_folder, 'dispersion_diagram_ex' + '.jpg')
        print(savefigname)
        plt.savefig(savefigname, format='jpeg', dpi=1440, bbox_inches='tight', pil_kwargs={"quality": 99} )
        plt.close()

    def plot_phase_space(self,yrange):
        h5_files=sorted(glob.glob( self.data_folder + "*.h5" ))
        for data_path in h5_files:
            t1 = re.search(r'(?<=_)\d+(?=\.h5)', data_path).group()
            d1 = self.read_hdf5_file_ps(data_path, t1)

            plt.figure()
            plt.imshow(np.log(abs(d1)), extent=[0, 1, yrange[0], yrange[1]], interpolation='bilinear', aspect=1/np.diff(yrange), origin='lower', cmap='jet')
            plt.ylabel('ux (me * c)', fontsize=12,fontweight='bold')
            plt.xlabel('x', fontsize=12,fontweight='bold')
            plt.title('time step = ' + t1, fontsize=12,fontweight='bold')
            
            #plt.savefig("ps_plot_01.tif", format='tiff' , dpi=720, bbox_inches = 'tight' , pil_kwargs={"compression": "tiff_lzw"})#,pad_inches = 0)
            output_folder = os.path.join(data_folder, 'fig_output')
            os.makedirs(output_folder, exist_ok=True)
            savefigname = os.path.join(output_folder, 'PhaseSpace_e_all_xpx_' + t1.zfill(8) + '.jpg')
            print(savefigname)
            plt.savefig(savefigname, format='jpeg', dpi=400, bbox_inches='tight', pil_kwargs={"quality": 75} )
            plt.close()




class ImagetoAnime:
    def __init__(self, image_folder, ext1, anime_name):
        self.image_folder = image_folder
        self.image_extension = ext1
        self.image_paths = sorted(glob.glob(image_folder + "*." + ext1 ))
        self.anime_name = anime_name
        self.output_anime = image_folder + anime_name

    def transpose_images(self):
        tp_folder = self.image_folder + "tp_img/"
        os.makedirs(tp_folder, exist_ok=True)
        print("Transposing images...")
        images = []
        for path in self.image_paths:
            img = Image.open(path)
            transposed_img = img.transpose(Image.TRANSPOSE)
            transposed_img.save( tp_folder + os.path.basename(path) )

        print("Images transposed and saved to:", tp_folder)

    def convert_to_gif(self):
        print("Generating GIF animation...")
        images = []
        for path in self.image_paths:
            images.append(Image.open(path))

        with Image.open(self.image_paths[0]) as first_image:
            first_image.save(self.output_anime + ".gif", save_all=True, append_images=images[1:], duration=200, loop=0, optimize=True)
        print(self.output_anime + ".gif")

    def generate_video(self,fps=5):
        print("Generating video...")
        frame = cv2.imread(self.image_paths[0])
        height, width, layers = frame.shape
        video = cv2.VideoWriter(self.output_anime + ".avi", cv2.VideoWriter_fourcc(*'DIVX'), fps, (width, height), isColor=True)

        for image_path in self.image_paths:
            video.write(cv2.imread(image_path))

        video.release()
        print(self.output_anime + ".avi")






#simDir = "~/work/runs/HiPAC_two_stream_C_16/"
#mplot0=[0,7]

#simDir = "~/work/runs/HiPAC_two_stream_A_08/"
#mplot0=[0,1,2,5,6,9]

simDir = "~/work/runs/HiPAC_two_stream_D_08/"
mplot0=[0,7,9]


for mplot in mplot0:
	if mplot==0:
		# plot energy - time, for all cases
		data_folder = os.path.expanduser( simDir + "/simOutput/")
		energy_plot = EnergyPlot(data_folder)
		energy_plot.plot_energy()
		
	elif mplot==1:
		# transpose png figure, for Cases A & B
		data_folder = os.path.expanduser( simDir + "/simOutput/pngElectronsYX/")
		transpose1 = ImagetoAnime( data_folder , "png", "PrtField_anime" )
		transpose1.transpose_images()
		
	elif mplot==2:
		# plot dispersion diagrams, high temporal resolution, for Case A 
		data_folder = os.path.expanduser( simDir + "/simOutput/openPMD/")
		hdf5_plot = HDF5Plot(data_folder)
		hdf5_plot.plot_ex_fft( wmax=16 , kmax=0.15 , nt_init=500 )
		
	elif mplot==3:
		# plot dispersion diagrams, low temporal resolution, for Case B
		data_folder = os.path.expanduser( simDir + "/simOutput/openPMD/")
		hdf5_plot = HDF5Plot(data_folder)
		hdf5_plot.plot_ex_fft( wmax=4 , kmax=0.2 , nt_init=50 )
		
	elif mplot==4:
		# create gif for field plots, for Cases A & B
		data_folder = os.path.expanduser( simDir + "/simOutput/pngElectronsYX/tp_img/")
		converter = ImagetoAnime( data_folder , "png", "PrtField_anime" )
		converter.convert_to_gif()
		
	elif mplot==5:
		# create video for field plots, for Cases A & B
		data_folder = os.path.expanduser( simDir + "/simOutput/pngElectronsYX/tp_img/")
		converter = ImagetoAnime( data_folder , "png", "PrtField_anime" )
		converter.generate_video()
		
	elif mplot==6:
		# plot phase space, for Cases A & B
		data_folder = os.path.expanduser( simDir + "/simOutput/phaseSpace/")
		hdf5_plot = HDF5Plot(data_folder)
		hdf5_plot.plot_phase_space( yrange=[-0.5,2.5] )
		
	elif mplot==7:
		# plot phase space, for Case C
		data_folder = os.path.expanduser( simDir + "/simOutput/phaseSpace/")
		hdf5_plot = HDF5Plot(data_folder)
		hdf5_plot.plot_phase_space( yrange=[-1.0,1.0] )
		
	elif mplot==8:
		# create gif for phase space plots, for Cases A & B
		data_folder = os.path.expanduser( simDir + "/simOutput/phaseSpace/fig_output/")
		converter = ImagetoAnime( data_folder , "jpg", "PhaseSpace" )
		converter.convert_to_gif()
		
	elif mplot==9:
		# create video for phase space plots, for Cases A & B
		data_folder = os.path.expanduser( simDir + "/simOutput/phaseSpace/fig_output/")
		converter = ImagetoAnime( data_folder , "jpg", "PhaseSpace" )
		converter.generate_video(fps=12)

exit()


