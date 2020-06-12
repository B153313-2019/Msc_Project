cd ~/project/SeqData/Bennett/ChIPseq_2019
datadir=$(pwd)
trimdir=~/"project/Jinliang/ChIPseq2019/Trimmedseq_Jinliang"
mkdir $trimdir
ls -l ~/project/SeqData/Bennett/ChIPseq_2019/ | grep "^d" | awk '{print $9}' | grep "-" > ${trimdir}/samplenamelist.txt
while read sample
do
cutadapt -b "GATCGGAAGAGCACACGTCTGAACTCCAGTCAC" -B "GATCGGAAGAGCACACGTCTGAACTCCAGTCAC" -b "GTGACTGGAGTTCAGACGTGTGCTCTTCCGATC" -B "GTGACTGGAGTTCAGACGTGTGCTCTTCCGATC" -O 8 -m 50 --format=fastq -o ${trimdir}/${sample}.1.trimmed.fq.gz -p ${trimdir}/${sample}.2.trimmed.fq.gz ${datadir}/${sample}/*.1.gz ${datadir}/${sample}/*.2.gz > ${trimdir}/Trimminglog.log &
done < ${trimdir}/samplenamelist.txt

