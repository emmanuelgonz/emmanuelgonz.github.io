---
title: "PhytoOracle"
layout: single-portfolio
excerpt: "<img src='/images/IMG_0102.PNG' alt='PhytoOracle logo'>"
collection: research
order_number: 10
header:
    og_image: 'images/IMG_0102.PNG'
---

PhytoOracle is a series of modular, scalable phenomics data processing pipelines. Included in these pipelines is a 3D laser scanner processing pipeline which takes large point clouds and extracts individual plant point clouds. Ground truth height measurements were collected, hereby referred to as manually-extracted height. Manually-extracted and pipeline-extracted height measurements were compared to assess pipeline performance:

<div>
    <a href="https://plotly.com/~emmanuelg1/83/?share_key=rk7yb5Yaoy5W0gQjXpvXMM" target="_blank" title="season10_3d_manual_pipeline_correlation" style="display: block; text-align: center;"><img src="https://plotly.com/~emmanuelg1/83.png?share_key=rk7yb5Yaoy5W0gQjXpvXMM" alt="season10_3d_manual_pipeline_correlation" style="max-width: 100%;width: 1100px;"  width="1100" onerror="this.onerror=null;this.src='https://plotly.com/404.png';" /></a>
    <script data-plotly="emmanuelg1:83" sharekey-plotly="rk7yb5Yaoy5W0gQjXpvXMM" src="https://plotly.com/embed.js" async></script>
</div>

*Figure 1* Correlation between manually- and pipeline-extracted height measurements. The line-of-best fit was determined using the ordinary least-squares (OLS) method. 


<div>
    <a href="https://plotly.com/~emmanuelg1/85/?share_key=UPhswjgf3VrGDWHjzktVka" target="_blank" title="season10_3d_manual_pipeline_correlation_labeler" style="display: block; text-align: center;"><img src="https://plotly.com/~emmanuelg1/85.png?share_key=UPhswjgf3VrGDWHjzktVka" alt="season10_3d_manual_pipeline_correlation_labeler" style="max-width: 100%;width: 1100px;"  width="1100" onerror="this.onerror=null;this.src='https://plotly.com/404.png';" /></a>
    <script data-plotly="emmanuelg1:85" sharekey-plotly="UPhswjgf3VrGDWHjzktVka" src="https://plotly.com/embed.js" async></script>
</div>

*Figure 2* Correlation between manually- and pipeline-extracted height measurements by labeler. The line-of-best fit for each facet column was determined using the ordinary least-squares (OLS) method.