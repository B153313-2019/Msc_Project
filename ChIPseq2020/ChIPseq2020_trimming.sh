cd ~/project/SeqData/Bennett/ChIPseq_2020
datadir=$(pwd)
trimdir=~/"project/Jinliang/ChIPseq2020/Trimmedseq_Jinliang"
mkdir $trimdir
ls ~/project/SeqData/Bennett/ChIPseq_2020/ | grep ".fq.gz" | sort -n -k 2 -t "-" | xargs -l2 > ${trimdir}/samplenamelist.txt
while read -r fq1 fq2
do
cutadapt -b "GATCGGAAGAGCACACGTCTGAACTCCAGTCAC" -B "GATCGGAAGAGCACACGTCTGAACTCCAGTCAC" -b "GTGACTGGAGTTCAGACGTGTGCTCTTCCGATC" -B "GTGACTGGAGTTCAGACGTGTGCTCTTCCGATC" -O 8 -m 50 --format=fastq -o ${trimdir}/${fq1}.trimmed.fq.gz -p ${trimdir}/${fq2}.trimmed.fq.gz ${datadir}/$fq1 ${datadir}/$fq2 > ${trimdir}/Trimminglog.log &
done < ${trimdir}/samplenamelist.txt
