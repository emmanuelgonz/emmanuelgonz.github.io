---
title: "Gene Expression Prediction"
# layout: single-portfolio
excerpt: "<img src='/images/research/cotton.png' style='width:auto; height:100px;'>"
collection: research
author_profile: False
# toc: true
order_number: 2
header:
  og_image: 'research/cotton.png'
---

-   <a href="#soft-thresholding-power" id="toc-soft-thresholding-power">Soft
    Thresholding Power</a>
-   <a href="#full-data-clustering" id="toc-full-data-clustering">Full Data
    Clustering</a>
-   <a href="#full-data-kegg-analysis" id="toc-full-data-kegg-analysis">Full
    Data KEGG Analysis</a>
-   <a href="#automatic-network-construction-module-detection"
    id="toc-automatic-network-construction-module-detection">Automatic
    Network Construction &amp; Module Detection</a>
    -   <a href="#kegg-analysis" id="toc-kegg-analysis">KEGG Analysis</a>
-   <a href="#step-by-step-network-construction-module-detection"
    id="toc-step-by-step-network-construction-module-detection">Step-By-Step
    Network Construction &amp; Module Detection</a>
    -   <a href="#kegg-analysis-1" id="toc-kegg-analysis-1">KEGG Analysis</a>
        -   <a href="#dynamic-colors" id="toc-dynamic-colors">Dynamic Colors</a>
        -   <a href="#merged-colors" id="toc-merged-colors">Merged Colors</a>
-   <a href="#block-wise-network-construction-module-detection"
    id="toc-block-wise-network-construction-module-detection">Block-wise
    Network Construction &amp; Module Detection</a>
    -   <a href="#kegg-analysis-2" id="toc-kegg-analysis-2">KEGG Analysis</a>
        -   <a href="#module-colors" id="toc-module-colors">Module Colors</a>
        -   <a href="#blockwise-colors" id="toc-blockwise-colors">Blockwise
            Colors</a>

<iframe src="https://docs.google.com/presentation/d/e/2PACX-1vQh_eHUmM5R7JxMEeXWd9Y10E9ZKLaqQ9FYkzmGlezRMt5WGITnnOYlXpvWcQVPa1voVQ0UO1btS1nP/embed?start=true&amp;loop=true&amp;delayms=3000" frameborder="0" width="576" height="878.5" allowfullscreen="true" mozallowfullscreen="true" webkitallowfullscreen="true">
</iframe>

# Soft Thresholding Power

``` r
# Set powers to sample
powers = c(c(1:10), seq(from = 12, to = 60, by = 4))

# Call the network topology analysis function
sft = pickSoftThreshold(datExpr, powerVector = powers, verbose = 0)
k <- softConnectivity(datE = datExpr, power = sft$powerEstimate)
```

``` r
# Plot the results:
par(mfrow = c(1, 2))
cex1 = 0.9

# Scale-free topology fit index as a function of the
# soft-thresholding power
plot(sft$fitIndices[, 1], -sign(sft$fitIndices[, 3]) * sft$fitIndices[,
    2], xlab = "Soft Threshold (power)", ylab = "Scale Free Topology Model Fit,signed R^2",
    type = "n", main = paste("Scale independence"))
text(sft$fitIndices[, 1], -sign(sft$fitIndices[, 3]) * sft$fitIndices[,
    2], labels = powers, cex = cex1, col = "red")

# this line corresponds to using an R^2 cut-off of h
abline(h = 0.8, col = "red")

# Mean connectivity as a function of the soft-thresholding
# power
fig <- plot(sft$fitIndices[, 1], sft$fitIndices[, 5], xlab = "Soft Threshold (power)",
    ylab = "Mean Connectivity", type = "n", main = paste("Mean connectivity"))

text(sft$fitIndices[, 1], sft$fitIndices[, 5], labels = powers,
    cex = cex1, col = "red")
```

![](/files/wgcna_tri_report_updated_cleaned_organized_files/figure-markdown_github/unnamed-chunk-4-1.png)

``` r
par(mfrow = c(1, 2))
hist(k)
scaleFreePlot(k, main = "Check Scale free topology\n")
```

![](/files/wgcna_tri_report_updated_cleaned_organized_files/figure-markdown_github/unnamed-chunk-5-1.png)

# Full Data Clustering

``` r
# Cluster tress (check if any outliers existed among
# samples)
datExpr_tree <- hclust(dist(datExpr), method = "average")
par(mar = c(0, 5, 2, 0))
plot(datExpr_tree, main = "Sample clustering", sub = "", xlab = "",
    cex.lab = 2, cex.axis = 1, cex.main = 1, cex.lab = 1, cex = 0.5)
```

![](/files/wgcna_tri_report_updated_cleaned_organized_files/figure-markdown_github/unnamed-chunk-6-1.png)

# Full Data KEGG Analysis

``` r
length(dat)
enrichment_analysis(df = dat, plot_name = "Full Upper 20%")
```

![](/files/wgcna_tri_report_updated_cleaned_organized_files/figure-markdown_github/unnamed-chunk-7-1.png)

# Automatic Network Construction & Module Detection

``` r
net = blockwiseModules(datExpr, maxBlockSize = 5000, power = 30,
    TOMType = "unsigned", minModuleSize = 30, reassignThreshold = 0,
    mergeCutHeight = 0.07, numericLabels = TRUE, pamRespectsDendro = FALSE,
    saveTOMs = FALSE, verbose = 0)

# Plot the dendogram with color assignment
mergedColors = labels2colors(net$colors)
plotDendroAndColors(net$dendrograms[[1]], mergedColors[net$blockGenes[[1]]],
    "Module colors", dendroLabels = FALSE, hang = 0.03, addGuide = TRUE,
    guideHang = 0.05)
```

![](/files/wgcna_tri_report_updated_cleaned_organized_files/figure-markdown_github/unnamed-chunk-8-1.png)

``` r
moduleLabels = net$colors
moduleColors = labels2colors(net$colors)
MEs = net$MEs
geneTree = net$dendrograms[[1]]
```

## KEGG Analysis

``` r
out <- data.frame(gene = colnames(datExpr), module = moduleColors)

mods = unique(moduleColors)

for (mod in mods) {
    temp = subset(out, module == mod)
    result = filter(dat, dat$Gene %in% temp$gene)
    print(enrichment_analysis(df = result, plot_name = mod))
}
```

![](/files/wgcna_tri_report_updated_cleaned_organized_files/figure-markdown_github/unnamed-chunk-9-1.png)![](/files/wgcna_tri_report_updated_cleaned_organized_files/figure-markdown_github/unnamed-chunk-9-2.png)![](/files/wgcna_tri_report_updated_cleaned_organized_files/figure-markdown_github/unnamed-chunk-9-3.png)

# Step-By-Step Network Construction & Module Detection

``` r
softPower = sft$powerEstimate
adjacency = adjacency(datExpr, power = softPower)

# 2.B.3 Adjacenct to Topological Overlap Matrix (TOM) Done
# to minimize effects of noise and spurious associations
TOM = TOMsimilarity(adjacency)
```

    ## ..connectivity..
    ## ..matrix multiplication (system BLAS)..
    ## ..normalization..
    ## ..done.

``` r
dissTOM = 1 - TOM

# 2.B.4 Clustering using TOM: produces dendrogram of genes
geneTree = hclust(as.dist(dissTOM), method = "average")

# Plot the dendogram plot(geneTree, xlab='', sub='', main =
# 'Gene clustering on TOM-based dissimilarity', labels =
# FALSE, hang = 0.04);

# Set module size relatively high
minModuleSize = 30

# Module identification using dynamic tree cut:
dynamicMods = cutreeDynamic(dendro = geneTree, distM = dissTOM,
    deepSplit = 2, pamRespectsDendro = FALSE, minClusterSize = minModuleSize)
```

    ##  ..cutHeight not given, setting it to 0.999  ===>  99% of the (truncated) height range in dendro.
    ##  ..done.

``` r
# Plot the module assignment under the gene dendrogram How
# to convert numeric tables into colors
dynamicColors = labels2colors(dynamicMods)

# How to plot the dendrogram and colors underneath
plotDendroAndColors(geneTree, dynamicColors, "Dynamic Tree Cut",
    dendroLabels = FALSE, hang = 0.03, addGuide = TRUE, guideHang = 0.05,
    main = "Gene dendrogram and module colors")
```

![](/files/wgcna_tri_report_updated_cleaned_organized_files/figure-markdown_github/unnamed-chunk-10-1.png)

``` r
# 2.B.5 Merge modules whose expression profiles are very
# similar Calculate Eigengenes to quantify co-expression
# similarity of entire modules
MEList = moduleEigengenes(datExpr, colors = dynamicColors)
MEs = MEList$eigengenes

# Calculate dissimilarity
MEDiss = 1 - cor(MEs)

# Cluster module eigengnes and Plot thhe results
METree = hclust(as.dist(MEDiss), method = "average")
plot(METree, main = "Clustering of module eigengenes", xlab = "",
    sub = "")

# Create Height Cut
MEDissThres = 0.25
abline(h = MEDissThres, col = "red")
merge = mergeCloseModules(datExpr, dynamicColors, cutHeight = MEDissThres,
    verbose = 3)
```

    ##  mergeCloseModules: Merging modules whose distance is less than 0.25
    ##    multiSetMEs: Calculating module MEs.
    ##      Working on set 1 ...
    ##      moduleEigengenes: Calculating 11 module eigengenes in given set.
    ##    multiSetMEs: Calculating module MEs.
    ##      Working on set 1 ...
    ##      moduleEigengenes: Calculating 3 module eigengenes in given set.
    ##    Calculating new MEs...
    ##    multiSetMEs: Calculating module MEs.
    ##      Working on set 1 ...
    ##      moduleEigengenes: Calculating 3 module eigengenes in given set.

``` r
mergedColors = merge$colors
mergedMEs = merge$newMEs

# Plot Dendrogram again to see what the merge did to the
# module colors
plotDendroAndColors(geneTree, cbind(dynamicColors, mergedColors),
    c("Dynamic Tree Cut", "Merged dynamic"), dendroLabels = FALSE,
    hang = 0.03, addGuide = TRUE, guideHang = 0.05)
```

![](/files/wgcna_tri_report_updated_cleaned_organized_files/figure-markdown_github/unnamed-chunk-10-2.png)![](/files/wgcna_tri_report_updated_cleaned_organized_files/figure-markdown_github/unnamed-chunk-10-3.png)

## KEGG Analysis

### Dynamic Colors

``` r
out <- data.frame(gene = colnames(datExpr), module = dynamicColors)

mods = unique(dynamicColors)

for (mod in mods) {
    temp = subset(out, module == mod)
    result = filter(dat, dat$Gene %in% temp$gene)
    print(enrichment_analysis(df = result, plot_name = mod))
}
```

![](/files/wgcna_tri_report_updated_cleaned_organized_files/figure-markdown_github/unnamed-chunk-11-1.png)![](/files/wgcna_tri_report_updated_cleaned_organized_files/figure-markdown_github/unnamed-chunk-11-2.png)![](/files/wgcna_tri_report_updated_cleaned_organized_files/figure-markdown_github/unnamed-chunk-11-3.png)![](/files/wgcna_tri_report_updated_cleaned_organized_files/figure-markdown_github/unnamed-chunk-11-4.png)![](/files/wgcna_tri_report_updated_cleaned_organized_files/figure-markdown_github/unnamed-chunk-11-5.png)![](/files/wgcna_tri_report_updated_cleaned_organized_files/figure-markdown_github/unnamed-chunk-11-6.png)![](/files/wgcna_tri_report_updated_cleaned_organized_files/figure-markdown_github/unnamed-chunk-11-7.png)![](/files/wgcna_tri_report_updated_cleaned_organized_files/figure-markdown_github/unnamed-chunk-11-8.png)![](/files/wgcna_tri_report_updated_cleaned_organized_files/figure-markdown_github/unnamed-chunk-11-9.png)![](/files/wgcna_tri_report_updated_cleaned_organized_files/figure-markdown_github/unnamed-chunk-11-10.png)

### Merged Colors

``` r
out <- data.frame(gene = colnames(datExpr), module = mergedColors)

mods = unique(mergedColors)

for (mod in mods) {
    temp = subset(out, module == mod)
    result = filter(dat, dat$Gene %in% temp$gene)
    print(enrichment_analysis(df = result, plot_name = mod))
}
```

![](/files/wgcna_tri_report_updated_cleaned_organized_files/figure-markdown_github/unnamed-chunk-12-1.png)![](/files/wgcna_tri_report_updated_cleaned_organized_files/figure-markdown_github/unnamed-chunk-12-2.png)![](/files/wgcna_tri_report_updated_cleaned_organized_files/figure-markdown_github/unnamed-chunk-12-3.png)

# Block-wise Network Construction & Module Detection

``` r
bwnet = blockwiseModules(datExpr, maxBlockSize = 5000, power = 30,
    TOMType = "unsigned", minModuleSize = 30, reassignThreshold = 0,
    mergeCutHeight = 0.07, numericLabels = TRUE, saveTOMs = FALSE,
    verbose = 0)

# Relabel blockwise modules
bwLabels = matchLabels(bwnet$colors, moduleLabels)

# Labels to colors for plotting
bwModuleColors = labels2colors(bwLabels)

# Compare the single block to the block-wise network
# analysis
plotDendroAndColors(geneTree, cbind(moduleColors, bwModuleColors),
    c("Single", "Blockwise"), main = "Single block gene dendrogram and module colors",
    dendroLabels = FALSE, hang = 0.03, addGuide = TRUE, guideHang = 0.05)
```

![](/files/wgcna_tri_report_updated_cleaned_organized_files/figure-markdown_github/unnamed-chunk-13-1.png)

## KEGG Analysis

### Module Colors

``` r
out <- data.frame(gene = colnames(datExpr), module = moduleColors)

mods = unique(moduleColors)

for (mod in mods) {
    temp = subset(out, module == mod)
    result = filter(dat, dat$Gene %in% temp$gene)
    print(enrichment_analysis(df = result, plot_name = mod))
}
```

![](/files/wgcna_tri_report_updated_cleaned_organized_files/figure-markdown_github/unnamed-chunk-14-1.png)![](/files/wgcna_tri_report_updated_cleaned_organized_files/figure-markdown_github/unnamed-chunk-14-2.png)![](/files/wgcna_tri_report_updated_cleaned_organized_files/figure-markdown_github/unnamed-chunk-14-3.png)

### Blockwise Colors

``` r
out <- data.frame(gene = colnames(datExpr), module = bwModuleColors)

mods = unique(bwModuleColors)

for (mod in mods) {
    temp = subset(out, module == mod)
    result = filter(dat, dat$Gene %in% temp$gene)
    print(enrichment_analysis(df = result, plot_name = mod))
}
```

![](/files/wgcna_tri_report_updated_cleaned_organized_files/figure-markdown_github/unnamed-chunk-15-1.png)![](/files/wgcna_tri_report_updated_cleaned_organized_files/figure-markdown_github/unnamed-chunk-15-2.png)![](/files/wgcna_tri_report_updated_cleaned_organized_files/figure-markdown_github/unnamed-chunk-15-3.png)![](/files/wgcna_tri_report_updated_cleaned_organized_files/figure-markdown_github/unnamed-chunk-15-4.png)
