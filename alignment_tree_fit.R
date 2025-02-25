require(phangorn)
require(tools)
setwd("")

pruneAlnFromTree = function(alnfile, treefile, type = "DNA", format = "fasta", writealn=TRUE)
{
  #prune the alignment to have only the species in the tree
  #read in the alignment
  alnPhyDat = read.phyDat(alnfile, type = type, format = format)
  #read in the treefile
  genetree = read.tree(treefile)
  #eliminate species in the alignment but not the tree
  inboth = intersect(names(alnPhyDat),genetree$tip.label)
  alnPhyDat = subset(alnPhyDat, subset = inboth)
  if (writealn) {
    #write the new alignment with a revised filename
    fe = file_ext(alnfile)
    fpse = file_path_sans_ext(alnfile)
    write.phyDat(alnPhyDat, file=paste(fpse,".pruned.",fe,sep=""), format = format)
  }
  return(alnPhyDat)
}

pruneTreeFromAln = function (treefile, alnfile, type = "DNA", format = "phylip", writetree=TRUE)
{
  #prune the tree to have only the species in the alignment
  #read in the alignment
  alnPhyDat = read.phyDat(alnfile, type = type, format = format)
  #read in the treefile
  genetree = read.tree(treefile)
  #eliminate species in the alignment but not the tree and vice versa
  inboth = intersect(names(alnPhyDat),genetree$tip.label)
  todrop = genetree$tip.label[genetree$tip.label %in% inboth == FALSE]
  if (length(todrop) > 0) {
    genetree = drop.tip(genetree, todrop)
  }
  #unroot the tree
  genetree = unroot(genetree)
  if (writetree) {
    #write the new tree with a revised filename
    fe = file_ext(treefile)
    fpse = file_path_sans_ext(treefile)
    write.tree(genetree, file=paste(fpse,".pruned.",fe,sep=""))
  }
  return(genetree)
}


pruneAlnFromTree("OG.aln","OG.tre")
pruneTreeFromAln("OG.aln","OG.tre")
