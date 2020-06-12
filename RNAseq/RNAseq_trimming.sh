cd ~/project/SeqData/Bennett/RNAseq_2019
datadir=$(pwd)
trimdir=~/"project/Jinliang/RNAseq/Trimmedseq_Jinliang"
mkdir $trimdir
ls -l ~/project/SeqData/Bennett/RNAseq_2019/ | grep "^d" | awk '{print $9}' | grep "-"> ${trimdir}/samplenamelist.txt
while read sample
do
cutadapt -b "GATCGGAAGAGCACACGTCTGAACTCCAGTCAC" -b "GTGACTGGAGTTCAGACGTGTGCTCTTCCGATC" -O 8 -m 50 --format=fastq -o $trimdir/$sample.trimmed.fq.gz $datadir/${sample}/*.fq.gz > ${trimdir}/RNAseq_trimlog.log &
done < ${trimdir}/samplenamelist.txt
