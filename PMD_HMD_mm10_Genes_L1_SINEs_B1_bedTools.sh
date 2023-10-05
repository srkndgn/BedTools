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
    mkdir bed_tools_PMDvsHMD_mm10             # working directory should be outside the anaconda3 directory
    cd bed_tools_PMDvsHMD_mm10                # go to your bedtools working directory

# activate the bedtools environment in your working directory
    conda activate bedtools             #activate conda environment
    
# load your data/bed files into your working directory
    # if you are preparing for the all genes in a genome,  do not forget to add the strand column as a 6th column (chr, start, end, blank, blank, strant+-)
    # bed files should be in tab deliminated format without header
    # delete the 4th and 5th columns from the "PMD_mm10.bed" file
    # cut -f 1-3,6- PMD_mm10.bed > PMD_mm10_modified.bed

# by default, 'bedtools intersect' reports the intervals that represent overlaps between your two files
#########################################################################################################################    
# PMD vs mm10 genes files to create PMD_mm10_genes   
# PMD vs mm10 genes files # delete chrM containing lines
    bedtools intersect -a mm10_all_genes.bed -b PMD_mm10_modified.bed  > PMD_mm10_genes_intersect.bed -wa

# remove duplicate rows from a file in Unix, you can use the uniq command
    sort PMD_mm10_genes_intersect.bed | uniq > PMD_mm10_genes_intersect_no_duplicates_not_sorted.bed

# sort the file based on the first column
    sort -k1,1 PMD_mm10_genes_intersect_no_duplicates_not_sorted.bed > PMD_mm10_genes_sorted.bed

#########################################################################################################################

# HMD vs mm10 genes files to create HMD_mm10_genes   
# HMD vs mm10 genes files # delete chrM containing lines
    bedtools intersect -a mm10_all_genes.bed -b HMD_mm10_modified.bed  > HMD_mm10_genes_intersect.bed -wa

# remove duplicate rows from a file in Unix, you can use the uniq command
    sort HMD_mm10_genes_intersect.bed | uniq > HMD_mm10_genes_intersect_no_duplicates_not_sorted.bed

# sort the file based on the first column
    sort -k1,1 HMD_mm10_genes_intersect_no_duplicates_not_sorted.bed > HMD_mm10_genes_sorted.bed

#########################################################################################################################

#########################################################################################################################    
# PMD vs mm10 CpG_islands files to create PMD_mm10_CpG_islands   
# PMD vs mm10 CpG_islands files # delete chrM containing lines
    bedtools intersect -a CpG_islands_mm10.bed -b PMD_mm10_modified.bed  > PMD_mm10_CpG_islands_intersect.bed -wa

# remove duplicate rows from a file in Unix, you can use the uniq command
    sort PMD_mm10_CpG_islands_intersect.bed | uniq > PMD_mm10_CpG_islands_intersect_no_duplicates_not_sorted.bed

# sort the file based on the first column
    sort -k1,1 PMD_mm10_CpG_islands_intersect_no_duplicates_not_sorted.bed > PMD_mm10_CpG_islands_sorted.bed

#########################################################################################################################

# HMD vs mm10 CpG_islands files to create HMD_mm10_CpG_islands   
# HMD vs mm10 CpG_islands files # delete chrM containing lines
    bedtools intersect -a CpG_islands_mm10.bed -b HMD_mm10_modified.bed  > HMD_mm10_CpG_islands_intersect.bed -wa

# remove duplicate rows from a file in Unix, you can use the uniq command
    sort HMD_mm10_CpG_islands_intersect.bed | uniq > HMD_mm10_CpG_islands_intersect_no_duplicates_not_sorted.bed

# sort the file based on the first column
    sort -k1,1 HMD_mm10_CpG_islands_intersect_no_duplicates_not_sorted.bed > HMD_mm10_CpG_islands_sorted.bed

#########################################################################################################################

#########################################################################################################################    
# PMD vs mm10 Enhancers files to create PMD_mm10_Enhancers   
# PMD vs mm10 Enhancers files # delete chrM containing lines
    bedtools intersect -a Enhancers_mm10.bed -b PMD_mm10_modified.bed  > PMD_mm10_Enhancers_intersect.bed -wa

# remove duplicate rows from a file in Unix, you can use the uniq command
    sort PMD_mm10_Enhancers_intersect.bed | uniq > PMD_mm10_Enhancers_intersect_no_duplicates_not_sorted.bed

# sort the file based on the first column
    sort -k1,1 PMD_mm10_Enhancers_intersect_no_duplicates_not_sorted.bed > PMD_mm10_Enhancers_sorted.bed

#########################################################################################################################

# HMD vs mm10 Enhancers files to create HMD_mm10_Enhancers   
# HMD vs mm10 Enhancers files # delete chrM containing lines
    bedtools intersect -a Enhancers_mm10.bed -b HMD_mm10_modified.bed  > HMD_mm10_Enhancers_intersect.bed -wa

# remove duplicate rows from a file in Unix, you can use the uniq command
    sort HMD_mm10_Enhancers_intersect.bed | uniq > HMD_mm10_Enhancers_intersect_no_duplicates_not_sorted.bed

# sort the file based on the first column
    sort -k1,1 HMD_mm10_Enhancers_intersect_no_duplicates_not_sorted.bed > HMD_mm10_Enhancers_sorted.bed

#########################################################################################################################

#########################################################################################################################    
# PMD vs mm10 IAPEz_int files to create PMD_mm10_IAPEz_int   
# PMD vs mm10 IAPEz_int files # delete chrM containing lines
    bedtools intersect -a IAPEz_int_mm10.bed -b PMD_mm10_modified.bed  > PMD_mm10_IAPEz_int_intersect.bed -wa

# remove duplicate rows from a file in Unix, you can use the uniq command
    sort PMD_mm10_IAPEz_int_intersect.bed | uniq > PMD_mm10_IAPEz_int_intersect_no_duplicates_not_sorted.bed

# sort the file based on the first column
    sort -k1,1 PMD_mm10_IAPEz_int_intersect_no_duplicates_not_sorted.bed > PMD_mm10_IAPEz_int_sorted.bed

#########################################################################################################################

# HMD vs mm10 IAPEz_int files to create HMD_mm10_IAPEz_int   
# HMD vs mm10 IAPEz_int files # delete chrM containing lines
    bedtools intersect -a IAPEz_int_mm10.bed -b HMD_mm10_modified.bed  > HMD_mm10_IAPEz_int_intersect.bed -wa

# remove duplicate rows from a file in Unix, you can use the uniq command
    sort HMD_mm10_IAPEz_int_intersect.bed | uniq > HMD_mm10_IAPEz_int_intersect_no_duplicates_not_sorted.bed

# sort the file based on the first column
    sort -k1,1 HMD_mm10_IAPEz_int_intersect_no_duplicates_not_sorted.bed > HMD_mm10_IAPEz_int_sorted.bed

#########################################################################################################################

#########################################################################################################################    
# PMD vs mm10 IAPs files to create PMD_mm10_IAPs   
# PMD vs mm10 IAPs files # delete chrM containing lines
    bedtools intersect -a IAPs_mm10.bed -b PMD_mm10_modified.bed  > PMD_mm10_IAPs_intersect.bed -wa

# remove duplicate rows from a file in Unix, you can use the uniq command
    sort PMD_mm10_IAPs_intersect.bed | uniq > PMD_mm10_IAPs_intersect_no_duplicates_not_sorted.bed

# sort the file based on the first column
    sort -k1,1 PMD_mm10_IAPs_intersect_no_duplicates_not_sorted.bed > PMD_mm10_IAPs_sorted.bed

#########################################################################################################################

# HMD vs mm10 IAPs files to create HMD_mm10_IAPs   
# HMD vs mm10 IAPs files # delete chrM containing lines
    bedtools intersect -a IAPs_mm10.bed -b HMD_mm10_modified.bed  > HMD_mm10_IAPs_intersect.bed -wa

# remove duplicate rows from a file in Unix, you can use the uniq command
    sort HMD_mm10_IAPs_intersect.bed | uniq > HMD_mm10_IAPs_intersect_no_duplicates_not_sorted.bed

# sort the file based on the first column
    sort -k1,1 HMD_mm10_IAPs_intersect_no_duplicates_not_sorted.bed > HMD_mm10_IAPs_sorted.bed

#########################################################################################################################

#########################################################################################################################    
# PMD vs mm10 L1 files to create PMD_mm10_L1   
# PMD vs mm10 L1 files # delete chrM containing lines
    bedtools intersect -a L1_mm10.bed -b PMD_mm10_modified.bed  > PMD_mm10_L1_intersect.bed -wa

# remove duplicate rows from a file in Unix, you can use the uniq command
    sort PMD_mm10_L1_intersect.bed | uniq > PMD_mm10_L1_intersect_no_duplicates_not_sorted.bed

# sort the file based on the first column
    sort -k1,1 PMD_mm10_L1_intersect_no_duplicates_not_sorted.bed > PMD_mm10_L1_sorted.bed

#########################################################################################################################

# HMD vs mm10 L1 files to create HMD_mm10_L1   
# HMD vs mm10 L1 files # delete chrM containing lines
    bedtools intersect -a L1_mm10.bed -b HMD_mm10_modified.bed  > HMD_mm10_L1_intersect.bed -wa

# remove duplicate rows from a file in Unix, you can use the uniq command
    sort HMD_mm10_L1_intersect.bed | uniq > HMD_mm10_L1_intersect_no_duplicates_not_sorted.bed

# sort the file based on the first column
    sort -k1,1 HMD_mm10_L1_intersect_no_duplicates_not_sorted.bed > HMD_mm10_L1_sorted.bed

#########################################################################################################################

#########################################################################################################################    
# PMD vs mm10 SINEs files to create PMD_mm10_SINEs   
# PMD vs mm10 SINEs files # delete chrM containing lines
    bedtools intersect -a SINEs_mm10.bed -b PMD_mm10_modified.bed  > PMD_mm10_SINEs_intersect.bed -wa

# remove duplicate rows from a file in Unix, you can use the uniq command
    sort PMD_mm10_SINEs_intersect.bed | uniq > PMD_mm10_SINEs_intersect_no_duplicates_not_sorted.bed

# sort the file based on the first column
    sort -k1,1 PMD_mm10_SINEs_intersect_no_duplicates_not_sorted.bed > PMD_mm10_SINEs_sorted.bed

#########################################################################################################################

# HMD vs mm10 SINEs files to create HMD_mm10_SINEs   
# HMD vs mm10 SINEs files # delete chrM containing lines
    bedtools intersect -a SINEs_mm10.bed -b HMD_mm10_modified.bed  > HMD_mm10_SINEs_intersect.bed -wa

# remove duplicate rows from a file in Unix, you can use the uniq command
    sort HMD_mm10_SINEs_intersect.bed | uniq > HMD_mm10_SINEs_intersect_no_duplicates_not_sorted.bed

# sort the file based on the first column
    sort -k1,1 HMD_mm10_SINEs_intersect_no_duplicates_not_sorted.bed > HMD_mm10_SINEs_sorted.bed

#########################################################################################################################

#########################################################################################################################    
# PMD vs mm10 B1 files to create PMD_mm10_B1   
# PMD vs mm10 B1 files # delete chrM containing lines
    bedtools intersect -a B1_mm10.bed -b PMD_mm10_modified.bed  > PMD_mm10_B1_intersect.bed -wa

# remove duplicate rows from a file in Unix, you can use the uniq command
    sort PMD_mm10_B1_intersect.bed | uniq > PMD_mm10_B1_intersect_no_duplicates_not_sorted.bed

# sort the file based on the first column
    sort -k1,1 PMD_mm10_B1_intersect_no_duplicates_not_sorted.bed > PMD_mm10_B1_sorted.bed

#########################################################################################################################

# HMD vs mm10 B1 files to create HMD_mm10_B1   
# HMD vs mm10 B1 files # delete chrM containing lines
    bedtools intersect -a B1_mm10.bed -b HMD_mm10_modified.bed  > HMD_mm10_B1_intersect.bed -wa

# remove duplicate rows from a file in Unix, you can use the uniq command
    sort HMD_mm10_B1_intersect.bed | uniq > HMD_mm10_B1_intersect_no_duplicates_not_sorted.bed

# sort the file based on the first column
    sort -k1,1 HMD_mm10_B1_intersect_no_duplicates_not_sorted.bed > HMD_mm10_B1_sorted.bed

#########################################################################################################################
#########################################################################################################################    
# PMD vs mm10 ERVK files to create PMD_mm10_ERVK   
# PMD vs mm10 ERVK files # delete chrM containing lines
    bedtools intersect -a ERVK_mm10.bed -b PMD_mm10_modified.bed  > PMD_mm10_ERVK_intersect.bed -wa

# remove duplicate rows from a file in Unix, you can use the uniq command
    sort PMD_mm10_ERVK_intersect.bed | uniq > PMD_mm10_ERVK_intersect_no_duplicates_not_sorted.bed

# sort the file based on the first column
    sort -k1,1 PMD_mm10_ERVK_intersect_no_duplicates_not_sorted.bed > PMD_mm10_ERVK_sorted.bed

#########################################################################################################################

# HMD vs mm10 ERVK files to create HMD_mm10_ERVK   
# HMD vs mm10 ERVK files # delete chrM containing lines
    bedtools intersect -a ERVK_mm10.bed -b HMD_mm10_modified.bed  > HMD_mm10_ERVK_intersect.bed -wa

# remove duplicate rows from a file in Unix, you can use the uniq command
    sort HMD_mm10_ERVK_intersect.bed | uniq > HMD_mm10_ERVK_intersect_no_duplicates_not_sorted.bed

# sort the file based on the first column
    sort -k1,1 HMD_mm10_ERVK_intersect_no_duplicates_not_sorted.bed > HMD_mm10_ERVK_sorted.bed

#########################################################################################################################