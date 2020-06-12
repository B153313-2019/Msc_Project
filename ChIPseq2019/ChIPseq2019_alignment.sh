#Mapping ChIPseq to reference
#ChIPseq 2019 alignment
trimeddir=~/"project/Jinliang/ChIPseq2019/Trimmedseq_Jinliang"
aligndir=~/"project/Jinliang/ChIPseq2019/Aligned_seq"
mkdir $aligndir
ls ${trimeddir} | grep ".fq" | cut -d "." -f 1 | sort -n -k 2 -t "-" | uniq > ${aligndir}/filelist.txt
while read fq
do
echo "This is ${fq}."
bowtie2 -p 10 --no-discordant --no-mixed --no-unal -x ~/project/Jinliang/genome_arab/bowtie_index/arab_index -1 ${trimeddir}/${fq}.1.trimmed.fq -2 ${trimeddir}/${fq}.2.trimmed.fq | samtools sort -n -O bam -@ 10 -o - > ${aligndir}/${fq}.name_sorted.bam
done < ${aligndir}/filelist.txt
