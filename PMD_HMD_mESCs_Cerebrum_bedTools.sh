# awk script example to save your desired file format

awk '{print $1","$2","$3}' solo_WCGW_mm10.bed > solo_WCGW_mm10_comma.csv

awk '{print $1","$2","$3}' solo_WCGW_mm10.bed > solo_WCGW_mm10_comma.bed

awk '{print $1 "\t" $2 "\t" $3}' solo_WCGW_mm10.bed > solo_WCGW_mm10_tab.bed


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
    mkdir PMD_HMD_mESCs_Cerebrum_bedTools             # working directory should be outside the anaconda3 directory
    cd PMD_HMD_mESCs_Cerebrum_bedTools                # go to your bedtools working directory

# activate the bedtools environment in your working directory
    PMD_HMD_mESCs_Cerebrum_bedTools             #activate conda environment
    
# 1- load your data/bed files into your working directory
    # bed files should be in tab deliminated format without header

    #If your data is comma-separated and you want to convert it to tab-delimited format using awk, you can modify the awk command like this:
        awk -F',' '{OFS="\t"; print $1, $2, $3}' mESC_E14_Dnmt3b.bed > df_mESC_CpG_coord.bed
        # delete the header
        tail -n +2 df_mESC_CpG_coord.bed > df_mESC_CpG_coord_no_header.bed
        
        awk -F',' '{OFS="\t"; print $1, $2, $3}' Spleen_Cdca7.bed > df_spleen_CpG_coord.bed

    #If your data is space-delimited format, you can modify the awk command like this:    
        awk -F' ' '{OFS="\t"; print $1, $2, $3}' cerebrum_E4_WT.bed > df_cerebrum_CpG_coord.bed
        awk -F'\t' '{NF=3}1' cerebrum_E4_WT.bed > df_cerebrum_CpG_coord.bed

   
# 2- by default, 'bedtools intersect' reports the intervals that represent overlaps between your two files
    
    bedtools intersect -a 01_promoters_mm10_1000tss100_tab.bed -b PMD_mm10.bed | head -n 5
    

# 4- you can save the results to a file

# Promoters  
    bedtools intersect -a 01_promoters_mm10_1000tss100_tab.bed -b PMD_mm10.bed > PMD_promoters_intersect.bed
    bedtools intersect -a 01_promoters_mm10_1000tss100_tab.bed -b HMD_mm10.bed > HMD_promoters_intersect.bed

    bedtools intersect -a df_mESC_CpG_coord_no_header.bed -b PMD_promoters_intersect.bed > PMD_mESC_promoters_intersect.bed
    bedtools intersect -a df_mESC_CpG_coord_no_header.bed -b HMD_promoters_intersect.bed > HMD_mESC_promoters_intersect.bed

    bedtools intersect -a df_cerebrum_CpG_coord.bed -b PMD_promoters_intersect.bed > PMD_cerebrum_promoters_intersect.bed
    bedtools intersect -a df_cerebrum_CpG_coord.bed -b HMD_promoters_intersect.bed > HMD_cerebrum_promoters_intersect.bed

    bedtools intersect -a df_spleen_CpG_coord.bed -b PMD_promoters_intersect.bed > PMD_spleen_promoters_intersect.bed
    bedtools intersect -a df_spleen_CpG_coord.bed -b HMD_promoters_intersect.bed > HMD_spleen_promoters_intersect.bed



# Gene bodies
    bedtools intersect -a 02_gene_body_mm10_tss100_tab.bed -b PMD_mm10.bed > PMD_gene_body_intersect.bed
    bedtools intersect -a 02_gene_body_mm10_tss100_tab.bed -b HMD_mm10.bed > HMD_gene_body_intersect.bed 

    bedtools intersect -a df_mESC_CpG_coord_no_header.bed -b PMD_gene_body_intersect.bed > PMD_mESC_gene_body_intersect.bed
    bedtools intersect -a df_mESC_CpG_coord_no_header.bed -b HMD_gene_body_intersect.bed > HMD_mESC_gene_body_intersect.bed

    bedtools intersect -a df_cerebrum_CpG_coord.bed -b PMD_gene_body_intersect.bed > PMD_cerebrum_gene_body_intersect.bed
    bedtools intersect -a df_cerebrum_CpG_coord.bed -b HMD_gene_body_intersect.bed > HMD_cerebrum_gene_body_intersect.bed

    bedtools intersect -a df_spleen_CpG_coord.bed -b PMD_gene_body_intersect.bed > PMD_spleen_gene_body_intersect.bed
    bedtools intersect -a df_spleen_CpG_coord.bed -b HMD_gene_body_intersect.bed > HMD_spleen_gene_body_intersect.bed