cd ~/project/SeqData/Bennett/ChIPseq_2019
datadir=$(pwd)
qcdir=~/"project/Jinliang/ChIPseq2019/QC"
mkdir $qc
ls -l ~/project/SeqData/Bennett/ChIPseq_2019/ | grep "^d" | awk '{print $9}' | grep "-" > ${qcdir}/samplenamelist.txt
while read processlist
do
fastqc -o ${qcdir} --extract -t 6 -q ${datadir}/${sample}/*.1.gz
fastqc -o ${qcdir} --extract -t 6 -q ${datadir}/${sample}/*.2.gz
done <  ${qcdir}/samplenamelist.txt