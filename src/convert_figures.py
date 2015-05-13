from PIL import Image, TiffImagePlugin
import os

# List figure folders
fig_files = ['figs/Figure1/Fig1.png',
             'figs/Figure2/Fig2.png',
             'figs/Figure3/Fig3.png',
             'figs/Figure4/Fig4_600dpi.png',
             'figs/Figure5/Fig5_600dpi.png',
             'figs/Figure6/Fig6_combined_600dpi.png']

for fig_file in fig_files:
  print('Converting {0} to tif'.format(fig_file))
  TiffImagePlugin.WRITE_LIBTIFF = True
  im = Image.open(fig_file)
  fig_file_tif = fig_file.replace('png', 'tif')
  im.save(fig_file_tif, compression = "tiff_lzw")
  
print('All done')
