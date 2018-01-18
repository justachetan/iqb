# The following code was submitted as a part
# of Homework Assignment - 2 of BIO215 offered
# at IIITD.
#
# Name              :       Aditya Chetan
# Roll No.          :       2016217
# Python Version    :       Python 3.6+



# Imports necessary for the code

import pandas as pd
import matplotlib.pyplot as plt
import numpy as np




# Reading the data file

df = pd.read_csv("./data/Cnv_detailsThu Jan 18 09_09_18 2018.csv")

# Extract the "Z-Score" records from the dataframe

z_score_data = df[ [ 'Expr Level (Z-Score)' ] ]


# Calculate mean and standard deviation of the data

mean = z_score_data.mean()[0]

stddev = z_score_data.std()[0]

# Printing the mean value and standard deviation to
# console

print("\n\nFor Z-Score:\n1. Mean:\t\t",mean,\
        "\n2. Standard deviation:\t",stddev,"\n")

# Plot the records as a normalised histogram

z_score_data.hist(normed=1)

# Extract the "Copy Number" records from the dataframe

copy_number_data = df[ [ 'Copy Number' ] ]
copy_number_data = copy_number_data.dropna()

# Extract NumPy arrays of the two columns

z_score_array = z_score_data.stack().as_matrix()[:20]
copy_number_array = copy_number_data.stack().as_matrix()


# Calculate the correlation between the two variables

corr = np.corrcoef(z_score_array, copy_number_array)[1][0]

# Print the correlation coefficient to console
print("\n\nThe correlation coefficient of Z-Score and Copy number is"\
        ,corr, "\n")

# Show the plotted figure

plt.show()









