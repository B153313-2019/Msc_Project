#Mapping RNAseq to reference
trimeddir=~/"project/Jinliang/RNAseq/Trimmedseq_Jinliang"
aligndir=~/"project/Jinliang/RNAseq/Aligned_seq"
mkdir $aligndir
ls $trimeddir | grep "fq" > ${aligndir}/filelist.txt
while read fq
do
echo "This is ${fq}."
bowtie2 -p 10 -x ~/project/Jinliang/genome_arab/bowtie_index/arab_index -U ${trimeddir}/${fq} | samtools sort -n -O bam -@ 10 -o - > ${aligndir}/${fq}.name_sorted.bam
done < ${aligndir}/filelist.txt
