#Mapping ChIPseq to reference
#ChIPseq 2020 alignment
trimeddir=~/"project/Jinliang/ChIPseq2020/Trimmedseq_Jinliang"
aligndir=~/"project/Jinliang/ChIPseq2020/Aligned_seq"
mkdir $aligndir
ls ${trimeddir} | grep ".fq" | cut -d "_" -f 1-5 | sort -n -k 2 -t "-" | uniq > ${aligndir}/filelist.txt
while read fq
do
echo "This is ${fq}."
bowtie2 -p 10 --no-unal --no-mixed --no-discordant -x ~/project/Jinliang/genome_arab/bowtie_index/arab_index -1 ${trimeddir}/${fq}_1.fq.gz.trimmed.fq -2 ${trimeddir}/${fq}_2.fq.gz.trimmed.fq | samtools sort -n -O bam -@ 10 -o - > ${aligndir}/${fq}.name_sorted.bam
done < ${aligndir}/filelist.txt
