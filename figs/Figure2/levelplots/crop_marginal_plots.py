#!/usr/bin/env python

from PIL import Image
import glob, os

# Define crop sizes in pixels
x_crop = 75
y_crop = 75

# Where to save the marginal plots
output_folder = "marginal_plots"

# Define how much needs to be cropped in order to get rid of the legend
legend_crop = 760

for infile in glob.glob("p*.png"):
    
    print("Processing image %s" % infile)

    filename, ext = os.path.splitext(infile)
    prefix = filename.split("_")[0]
    im = Image.open(infile)
    
    # Original image size
    width, height = im.size
    # First, crop off the legend
    im_noleg = im.crop((0, 0, width, legend_crop))
    #im.save(filename + "_noleg.png")

    # Process both x and y marginal plots
    
    # Update image size
    width, height = im_noleg.size

    im_x_plot = im_noleg.crop((0, 0, width, x_crop))
    im_y_plot = im_noleg.crop((width-y_crop, 0, width, height)) 
    
    # Save the cropped images
    im_noleg.save(prefix + ".png")
    im_x_plot.save(os.path.join(output_folder, filename + "_xplot.png"))
    im_y_plot.save(os.path.join(output_folder, filename + "_yplot.png"))
