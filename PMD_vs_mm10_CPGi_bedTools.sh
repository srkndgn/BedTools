# Bedtools is a fast, flexible toolset for genome arithmetic.
# Tutorial for bedtools > (http://quinlanlab.org/tutorials/bedtools/bedtools.html)
# Reference page > (https://bedtools.readthedocs.io/en/latest/index.html)

# To execute the contents of the .bashrc file in the current shell session (necessary to start conda)
    source ~/.bashrc

# install the bedtools
    cd anaconda3/envs/                  # go to your anaconda3 directory
    conda create --name bedtools        # create your bedtools environment
    
    cd anaconda3/envs/bedtools/         #go to your working directory
    
    conda activate bedtools             #activate conda environment
    
    conda install -c bioconda bedtools  #install bedtools
    
# create your working directory for your bedtools environment
    mkdir bed_tools_PMDvsCPGi             # working directory should be outside the anaconda3 directory
    cd bed_tools_PMDvsCPGi                # go to your bedtools working directory

# activate the bedtools environment in your working directory
    conda activate bedtools             #activate conda environment
    
# 1- load your data/bed files into your working directory
    # bed files should be in tab deliminated format without header
    # delete the 4th and 5th columns from the "PMD_mm10.bed" file
    cut -f 1-3,6- PMD_mm10.bed > PMD_mm10_modified.bed

# 2- by default, 'bedtools intersect' reports the intervals that represent overlaps between your two files

#########################################################################################################################    
# PMD vs mm10 CPGi files to create inside_PMD_mm10_CPGi
# PMD vs mm10 CPGi files
    bedtools intersect -a df_CpG_islands_coord_mm10.bed -b PMD_mm10_modified.bed  > inside_PMD_mm10_CPGi_intersect.bed -wa

# if necassary, sort the file based on the first column
    sort -k1,1 inside_PMD_mm10_CPGi_intersect.bed > inside_PMD_mm10_CPGi.bed   
   
#########################################################################################################################

# PMD vs mm10 CPGi files to create outside_PMD_mm10_CPGi
    bedtools intersect -a PMD_mm10_modified.bed -b df_CpG_islands_coord_mm10.bed > outside_PMD_mm10_CPGi_intersect.bed -wa

# remove duplicate rows from a file in Unix, you can use the uniq command
    sort outside_PMD_mm10_CPGi_intersect.bed | uniq > outside_PMD_mm10_CPGi_no_duplicates_not_sorted.bed

# sort the file based on the first column
    sort -k1,1 outside_PMD_mm10_CPGi_no_duplicates_not_sorted.bed > outside_PMD_mm10_CPGi_no_duplicates_sorted.bed

# Reporting the absence of any overlapping features
    bedtools intersect -a df_CpG_islands_coord_mm10.bed -b outside_PMD_mm10_CPGi_no_duplicates_sorted.bed > outside_PMD_mm10_CPGi.bed -v

##########################################################################################################################     
   
   