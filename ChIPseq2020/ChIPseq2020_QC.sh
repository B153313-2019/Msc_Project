cd ~/project/SeqData/Bennett/ChIPseq_2020
datadir=$(pwd)
qcdir=~/"project/Jinliang/ChIPseq2020/QC"
mkdir ${qcdir}
ls ~/project/SeqData/Bennett/ChIPseq_2020/ | grep ".fq.gz" | sort -n -k 2 -t "-" | xargs -l2 > ${qcdir}/samplenamelist.txt
while read processlist
do
fastqc -o ${qcdir} --extract -t 6 -q ${datadir}/$processlist
done <  ${qcdir}/samplenamelist.txt
