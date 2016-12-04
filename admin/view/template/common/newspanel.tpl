<link rel="stylesheet" type="text/css" href="view/blog-res/news-blog.css" />
<script src="view/blog-res/tooltipsy.min.js"></script>
<?php if ($error_warning) { ?>
	<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
<?php } ?>
  <?php if ($success) { ?>
  <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>
<div class="box blogwidget" style="margin-bottom: 8px;">
<div class="insideblogwidget">

<div class="bwinfo">
 <a class="bwlink" href="<?php echo $npages; ?>" title="<?php echo $entry_npages; ?>"><i class="fa fa-book"></i><span class="bli">Art</span></a>
 <a class="bwlink bwodd" href="<?php echo $ncategory; ?>" title="<?php echo $entry_ncategory; ?>"><i class="fa fa-folder-open"></i><span class="bli">Cat</span></a>
 <a class="bwlink" href="<?php echo $tocomments; ?>" title="<?php echo $text_commod; ?>"><i class="fa fa-comments"></i><span class="bli" style="margin-left: -10px;">Com</span></a>
 <a class="bwlink bwodd" href="<?php echo $nauthor; ?>" title="<?php echo $text_nauthor; ?>"><i class="fa fa-user"></i><span class="bli" style="margin-left: -9px;">Aut</span></a>
 <a class="bwlink" href="<?php echo $ncmod; ?>" title="<?php echo $entry_ncmod; ?>"><i class="fa fa-cogs"></i><span class="bli" style="margin-left: -12px;">Amm</span></a>
 <a class="bwlink bwodd" href="<?php echo $nmod; ?>" title="<?php echo $entry_nmod; ?>"><i class="fa fa-bookmark-o"></i><span class="bli" style="margin-left: -10px;">Lnm</span></a>
 <div class="bwstats">
	<table>
		<tr><td class="bwodd"><?php echo $text_tcaa; ?></td><td class="bwresult"><span><?php echo $total_comments_approval; ?></span></td>
		<td><?php echo $text_comtot; ?></td><td class="bwresult"><span><span><?php echo $total_coments; ?></span></span></td>
		<td class="bwodd"><?php echo $text_articles; ?></td><td class="bwresult"><span><?php echo $total_articles; ?></span></td>
		</tr>
	</table>
 </div>
 </div>
<script type='text/javascript'>
	$('.bwlink').tooltipsy({
    offset: [0, 5]
	});
</script>

</div>
</div>
