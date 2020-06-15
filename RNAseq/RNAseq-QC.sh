cd ~/project/SeqData/Bennett/RNAseq_2019
datadir=$(pwd)
qcdir=~/"project/Jinliang/RNAseq/QC"
mkdir ${qcdir}
ls -l ~/project/SeqData/Bennett/RNAseq_2019/ | grep "^d" | awk '{print $9}' | grep "-"> ${qcdir}/samplenamelist.txt
while read processlist
do
fastqc -o ${qcdir} --extract -t 6 -q ${datadir}/${sample}/*
done <  ${qcdir}/samplenamelist.txt

