## plan:
##### Take currently aligned BAM files, unalign them back to raw FASTQ, run QC using FASTQC, realign to Grch38, QC with IGV, variant call, variant annotate. 
 a script to convert BAM -> FASTQ, QC with FastQC, Then FASTQ -> indexed bam, QC with IGV, third script for variant calling and annotation to align, call, and annotate. 

### BAM -> FASTQ
Original BAM files are stored in `../../S????/. These are converted to FASTQ using SAMTOOLS (samtools 1.19.2 Using htslib 1.19.1) fastq command, with the fastq files being stored in `../data/fastq/`

A list of BAM file paths was created using echo
`../../../S????/S????_novoalign.bam > bam_list.txt`
and formatted using
`tr ' ' '\n' < bam_list.txt > bam_list_fixed.txt`
`mv bam_list_fixed.txt bam_list.txt`
The number of bam files were then checked using `wc -l`, and this was inputted into the script.`

The script was then run using `sbatch run_b2f.sh`

### QC 
FastQC (v0.12.1) was installed by running scripts/install_fastqc.sh and exported to path: `export PATH=$HOME/tools/FastQC:$PATH`

FastQC was run using `sbatch fastqc.sh` in the scripts directory

Fastp (v1.0.1)  was installed using the following:
`cd $HOME/tools
wget http://opengene.org/fastp/fastp
chmod a+x ./fastp
export PATH=$HOME/tools:$PATH`
Fastp reports are in ../data/fastq/

(FastQC reports:
S0208_R1: Red () Yellow (Per sequence GC content, Sequence length distibution) Decision (Keep)
S0208_R2: Red () Yellow (Per sequence GC content, Sequence length distibution) Decision (Keep)
S0209_R1: Red () Yellow (Per sequence GC content, Sequence length distibution) Decision (Keep)
S0209_R2: Red () Yellow (Per sequence GC content, Sequence length distibution) Decision (Keep)
S0394_R1: Red (Per tile sequence quality) Yellow (Per based N content, Sequence length distribution) Decision (Trimmed:
	`fastp   -i S0567_R1.fastq.gz   -I S0567_R2.fastq.gz   -o trimmed_S0567_R1.fastq.gz   -O trimmed_S0567_R2.fastq.gz   -q 20   -l 50   -n 5   --detect_adapter_for_pe   --disable_trim_
        poly_g   -h fastp_S0567_report.html)`)
S0394_R2: Red () Yellow (Per tile sequence quality, Sequence length distribution, Overrepresented sequences) Decision (Keep)
S0560_R1: Red () Yellow (Per base sequence quality, Per sequence GC content, Sequence Length Distribution) Decision (Keep)
S0560_R2: Red () Yellow (Sequence Length Distribution) Decision (Keep)
S0561_R1: Red () Yellow (Per base sequence quality, Sequence Length Distribution) Decision (Keep)
S0561_R2: Red () Yellow (Sequence Length Distribution) Decision (Keep)
S0562_R1: Red () Yellow (Per base sequence quality, Sequence Length Distribution) Decision (Keep)
S0562_R2: Red () Yellow (Sequence Length Distribution) Decision (Keep)
S0563_R1: Red () Yellow (Per base sequence quality, Sequence Length Distribution) Decision (Keep)
S0563_R2: Red () Yellow (Sequence Length Distribution) Decision (Keep)
S0567_R1: Red (Per tile sequence quality) Yellow (Per sequence GC content, Per base N content, Sequence Length Distribution) Decision (Sample was initially trimmed using the following code:
	`fastp   -i S0567_R1.fastq.gz   -I S0567_R2.fastq.gz   -o trimmed_S0567_R1.fastq.gz   -O trimmed_S0567_R2.fastq.gz   -q 20   -l 50   -n 5   --detect_adapter_for_pe   --disable_trim_
	poly_g   -h fastp_S0567_report.html)`
	However, after not seeing much improvement in based quality, it was hard trimmed using:
	`fastp   -i S0567_R1.fastq.gz   -I S0567_R2.fastq.gz   -o trimmed_S0567_R1.fastq.gz   -O trimmed_S0567_R2.fastq.gz   -q 20   -l 50   -n 5   --trim_tail1 20   --trim_tail2 20   --tri
	m_front1 5   --trim_front2 5   --detect_adapter_for_pe   --disable_trim_poly_g   -h fastp_S0567_report.html`
	This improved base quality and the sample was kept
S0567_R2: Red () Yellow (Per sequence GC content, Sequence Length Distribution) Decision (Keep)
S1008_R1: Red () Yellow (Per base sequence quality, Per tile sequence quality, Sequence Length Distribution) Decision (Trim end bases off:
	`fastp   -i S1008_R1.fastq.gz   -I S1008_R2.fastq.gz   -o trimmed_S1008_R1.fastq.gz   -O trimmed_S1008_R2.fastq.gz   --trim_tail1 5   --trim_tail2 5   -q 20   -l 50   -n 5   --detec
	t_adapter_for_pe   --disable_trim_poly_g   -h fastp_S1008_report.html)`
S1008_R2: Red () Yellow (Sequence Length Distribution) Decision (Trimmed same as S1008_R1)
S1009_R1: Red () Yellow (Per base sequence quality, Per tile sequence quality, Sequence Length Distribution) Decision (Trimmed last 5 bases same as S1008 due to drop in quality at 3' end)
S1009_R2: Red () Yellow (Per base sequence quality, Per tile sequence quality, Sequence Length Distribution) Decision (Trimmed last 5 bases same as S1008 due to drop in quality at 3' end)
S1010_R1: Red () Yellow (Per base sequence quality, Per tile sequence quality, Sequence Length Distribution) Decision (Trimmed last 5 bases same as S1009 due to drop in quality at 3' end)
S1010_R2: Red () Yellow (Per base sequence quality, Per tile sequence quality, Sequence Length Distribution) Decision (Trimmed last 5 bases same as S1009 due to drop in quality at 3' end)
S1011_R1: Red () Yellow (Per tile sequence quality, Sequence Length Distribution) Decision (Keep)
S1011_R2: Red () Yellow (Sequence Length Distribution) Decision (Keep)
S1012_R1: Red () Yellow (Per tile sequence quality, Sequence Length Distribution) Decision (Keep)
S1012_R2: Red () Yellow (Sequence Length Distribution) Decision (Keep)
S1013_R1: Red () Yellow (Per tile sequence quality, Sequence Length Distribution) Decision (Keep)
S1013_R2: Red () Yellow (Sequence Length Distribution) Decision (Keep)
S1014_R1: Red () Yellow (Per tile sequence quality, Sequence Length Distribution) Decision (Keep)
S1014_R2: Red () Yellow (Sequence Length Distribution) Decision (Keep)
S1015_R1: Red () Yellow (Sequence Length Distribution) Decision (Keep)
S1015_R2: Red () Yellow (Sequence Length Distribution) Decision (Keep)
S1016_R1: Red () Yellow (Sequence Length Distribution) Decision (Keep)
S1016_R2: Red () Yellow (Sequence Length Distribution) Decision (Keep)
S1017_R1: Red () Yellow (Sequence Length Distribution) Decision (Keep)
S1017_R2: Red () Yellow (Sequence Length Distribution) Decision (Keep)
S1018_R1: Red () Yellow (Sequence Length Distribution) Decision (Keep)
S1018_R2: Red () Yellow (Sequence Length Distribution) Decision (Keep)
S1019_R1: Red () Yellow (Sequence Length Distribution) Decision (Keep)
S1019_R2: Red () Yellow (Sequence Length Distribution) Decision (Keep)
S1020_R1: Red () Yellow (Sequence Length Distribution) Decision (Keep)
S1020_R2: Red () Yellow (Sequence Length Distribution) Decision (Keep)
S1021_R1: Red () Yellow (Sequence Length Distribution) Decision (Keep)
S1021_R2: Red () Yellow (Sequence Length Distribution) Decision (Keep)
S1022_R1: Red () Yellow (Sequence Length Distribution) Decision (Keep)
S1022_R2: Red () Yellow (Sequence Length Distribution) Decision (Keep)
S1023_R1: Red () Yellow (Sequence Length Distribution) Decision (Keep)
S1023_R2: Red (Per tile sequence quality) Yellow (Sequence Length Distribution, Overrepresented sequences) Decision (Hard trim last 11 bases, due this being where the drop in quality is located:
	fastp   -i S1023_R1.fastq.gz   -I S1023_R2.fastq.gz   -o trimmed_S1023_R1.fastq.gz   -O trimmed_S1023_R2.fastq.gz   --trim_tail2 11   -q 20   -l 50   -n 5   --detect_adapter_for_pe
	--disable_trim_poly_g   -h fastp_S1023_report.html)

At this point, multiqc (v1.9) was installed to help analyse the remaining samples:
	`module load bear-apps/2019b/live
	module load MultiQC/1.9-foss-2019b-Python-3.7.4`
Before being ran with the following code:
	`muiltiqc /data/qc/`
Visual inspection of /data/qc/MultiQC/multiqc_report.html resulting in trimming of the following samples:
S1612_R1
S1612_R2
S1613_R1
S1613_R2
S1614_R1
S1614_R2
S1615_R1 
S1615_R2 
S1617_R1
S1618_R1

Using the following code
`for sample in S1612_R1 S1612_R2 S1613_R1 S1613_R2 S1614_R1 S1614_R2 S1615_R1 S1615_R2 S1617_R1 S1618_R1; do
  fastp -i ${sample}.fastq.gz -o trimmed_${sample}.fastq.gz \
    --cut_front --cut_tail --cut_window_size 4 --cut_mean_quality 20 \
    --length_required 30 --thread 4 \
    --html ${sample}_fastp.html --json ${sample}_fastp.json
done`

Following qc, all included samples were moved into data/post_qc (trimmed versions were renamed in /post-qc to match original sample names for ease of downstream analysis, they maintain the trimmed prefix in /fastq)

### Alignment

Fastq files were aligned to the GRCh38 no alternative analysis set FASTA genome: ftp://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/000/001/405/GCA_000001405.15_GRCh38/seqs_for_alignment_pipelines.ucsc_ids/GCA_000001405.15_GRCh38_no_alt_analysis_set.fna.gz

/scripts/alignment.sh was used to align, sort, and index resulting in indexed bam files. Output is stored in data/aligned 
In order to run this script, both samtools (1.19.2) and bwa (0.7.19-r1273)  were installed beforehand:

#### bwa:
`# Create tools directory if it doesn't exist
mkdir -p $HOME/tools
cd $HOME/tools
# Download BWA source
git clone https://github.com/lh3/bwa.git
cd bwa
# Compile
make
# Add to PATH
echo 'export PATH=$HOME/tools/bwa:$PATH' >> ~/.bashrc
source ~/.bashrc`

#### samtools:
`# Go to tools dir
cd $HOME/tools
##### Download samtools source
wget https://github.com/samtools/samtools/releases/download/1.19.2/samtools-1.19.2.tar.bz2
tar -xvjf samtools-1.19.2.tar.bz2
cd samtools-1.19.2
##### Download and install HTSlib (dependency)
wget https://github.com/samtools/htslib/releases/download/1.19.2/htslib-1.19.2.tar.bz2
tar -xvjf htslib-1.19.2.tar.bz2
cd htslib-1.19.2
./configure --prefix=$HOME/tools/htslib
make && make install
##### Now compile samtools using that HTSlib
cd ../samtools-1.19.2
./configure --prefix=$HOME/tools/samtools --with-htslib=$HOME/tools/htslib
make && make install
##### Add to PATH
echo 'export PATH=$HOME/tools/samtools/bin:$PATH' >> ~/.bashrc
source ~/.bashrc`

alignment.sh was then run in /scripts/ using `sbatch alignment.sh`

Since the script timed out, analysis was continued where it left off using temp_alignment.sh

At this point, the script returned an error due to sample 1236 being corrupted. Inspection of the fastq and orignal bam file showed both to be corrupted, so the files were deleted and the script rerun
Same with sample 2382, so the temp_alignment script was edited to continue after 2382. 

#### Bam QC
Bam quality control was conducted using Samtools (1.19.2) flagstat. This was done by running /scripts/flagstat.sh, the results of which are stored in analysis/flagstat_summary.csv


### Variant calling

Variant calling was conducted using gatk (4.2.0.0)
First, Read groups were added by running add_rg.sh
HaplotypeCaller was used on the bam files in an array by running /scripts/haplotypecall.sh to create gvcfs
All gvfcs were combined into a multisample vcf and joint genotyped using GenomicsDBImport and GenotypeGVCFs via gdb_import_and_genotype.sh

### Variant annotation
Variant annotation was conducted using VEP (), via VEP cache homo_sapiens_vep_113_GRCh38.tar.gz
The cache was first downloaded into ../vep_cache:
wget ftp://ftp.ensembl.org/pub/release-113/variation/indexed_vep_cache/homo_sapiens_vep_113_GRCh38.tar.gz

CADD plugins were also downloaded:
wget https://krishna.gs.washington.edu/download/CADD/v1.4/GRCh38/whole_genome_SNVs.tsv.gz
wget https://krishna.gs.washington.edu/download/CADD/v1.4/GRCh38/whole_genome_SNVs.tsv.gz.tbi
wget https://krishna.gs.washington.edu/download/CADD/v1.4/GRCh38/InDels.tsv.gz
wget https://krishna.gs.washington.edu/download/CADD/v1.4/GRCh38/InDels.tsv.gz.tbi

The reference genome then had to be bgzipped:
module load bear-apps/2024a/live
module load HTSlib/1.21-GCC-13.3.0
bgzip -c GCA_000001405.15_GRCh38_no_alt_analysis_set.fna > GCA_000001405.15_GRCh38_no_alt_analysis_set.fna.gz
samtools faidx GCA_000001405.15_GRCh38_no_alt_analysis_set.fna.gz

The REVEL plugin was then added:
module load bear-apps/2021a/live
module load tabix/0.2.6-GCCcore-10.3.0
unzip revel-v1.3_all_chromosomes.zip
cat revel_with_transcript_ids | tr "," "\t" > tabbed_revel.tsv
sed '1s/.*/#&/' tabbed_revel.tsv > new_tabbed_revel.tsv
bgzip new_tabbed_revel.tsv
zcat new_tabbed_revel.tsv.gz | head -n1 > h
zgrep -h -v ^#chr new_tabbed_revel.tsv.gz | awk '$3 != "." ' | sort -k1,1 -k3,3n - | cat h - | bgzip -c > new_tabbed_revel_grch38.tsv.gz
tabix -f -s 1 -b 3 -e 3 new_tabbed_revel_grch38.tsv.gz

vep.sh was then run

### NOTE- currented files do not have CADD annotation due to plugin error

### Gene level burden test
(not done yet) Rare variant analysis was conducted using a gene-masked burden test with the following masking strategy: (stop_gained | stop_lost | frameshift | essential_splice | # (missense & REVEL_score_0_55)) & maf0_1, as recommended by Ioannidis et al.

### PCA 
Firstly, plink files were generated by running plink_file_gen.sh()


PCA was conducted by running plink_pca.sh (sha1sum: 49e69d877706a3cbde1bc8e77db71524960f9c2b)
The resultant principle components were then analysed in R:

`# Read eigenvectors
pcs <- read.table("plink_pca.eigenvec", header=FALSE)

# PLINK2 does not include a header, so we add one:
colnames(pcs) <- c("FID", "IID", paste0("PC", 1:(ncol(pcs)-2)))

# Check first rows
head(pcs)

# Read eigenvalues
eigs <- scan("plink_pca.eigenval")`

These principal components were then appended to gapp_final.xlsx. Data cleaning was conducted in GAPP_data_cleaning.Rmd

After evaluating the data, the first 40 genomic prinicple components were including due to them explaining 100% of the data's variance. In terms of phenotypes, only Platelet count, Platelet size, sex, and age where able to be included due to the other parameters missing data. Samples missing age or sex data were excluded, and the remaining samples which were missing platelet count or size data had that data imputed using KNN where k=5.

# GTM 
GTM was carried out in GMT.ipynb using the gtm_env conda environment


### Processing new files
New files were copied to /enter dir/ using:
find . -type f -name "*.fastq.gz" -exec cp {} /rds/projects/s/sharmaoa-gpcr/Liam/data/Mar_files2 \;

They were then tested for integrity using the following code:
`for f in *.fastq.gz; do
    echo "Testing $f..."
    gzip -t "$f"
    if [ $? -eq 0 ]; then
        echo "✅ $f OK"
    else
        echo "❌ $f CORRUPT or INCOMPLETE"
    fi
done`

All samples which were corrupted were re-transfered, and were checked for corruption at the original source. All corrupted files were removed

New files were first renamed using the naming convention detailed in the GAPP_metadata spreadsheet. All renamed files were copied to /data/raw.


Files which were per-lane were merged using `sbatch merge_lanes.sh` shasum: 2d458df50d8c700d462f70dbadb33277967442fa

### QC 
Fastqc was running using fastqc.sh, and results were inspected using multiqc which was run as previously mentioned

Several samples failed the Per Base Sequence Content, due to adapter contamination at the end of the sample, and therefore were trimmed using trim.sh (shasum f2ea63391bbf506f4314870fbecac8108f1bef93).

Final fastq files are stored in data/fastq_final

### Mapping
Fastq files were mapped using alignment_second_time.sh (c3e2c39661c070dbe3f2c573ebab4735e0dbfbb3)

bam qc was conducted using alignment_qc.sh 

### Variant calling
Variant calling was conducted via variant_calling.sh. Following an error message, the reference FASTA was indexed as such (from /scripts):
module purge
module load bear-apps/2024a/live
module load SAMtools/1.21-GCC-13.3.0
samtools faidx ../data/reference/GRCh38_no_alt.fna
module purge
module load bear-apps/2023a/live
module load picard/3.4.0-Java-17
java -jar $EBROOTPICARD/picard.jar CreateSequenceDictionary     R=../data/reference/GRCh38_no_alt.fna     O=../data/reference/GRCh38_no_alt.dict

Variant_calling.sh (shasum 3096c160bdf3b5a2d0b5b348ed721ac0d519ee4a) was then run again

This returned the following error message:
A USER ERROR has occurred: No intervals specified

After which, gdb_import_and_genotype2.sh (shasum 578c5b800dffce8dd3e6412cd2cfa9b42703fa45) was run. The resultant g.vcf was stored in ../data/vcf. The output was renamed, due to it actually being a vcf not gvcf
mv combined.g.vcf.gz combined.vcf.gz


### Variant annotation
vep2.sh (shasum 099ffccfb65f82bb16c1147e47e3376fe80117a1) was run
