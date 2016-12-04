<?php echo $header;
$theme_options = $this->registry->get('theme_options');
$config = $this->registry->get('config');
include('catalog/view/theme/'.$config->get('config_template').'/template/themeglobal/themeglobal_top.tpl'); ?>
<?php
	require_once( DIR_TEMPLATE.$config->get('config_template')."/lib/module.php" );
	$modules = new Modules($this->registry);
?>
<div itemscope itemtype="http://data-vocabulary.org/Product">
  <span itemprop="name" class="hidden"><?php echo $heading_title; ?></span>
  <div class="product-info">
  	<div class="row">
  		<div class="col-sm-<?php if($theme_options->get( 'custom_block', 'product_page', $config->get( 'config_language_id' ), 'status' ) == 1) { echo 9; } else { echo 12; } ?>">
  			<div class="row" id="quickview_product">
			    <?php if($theme_options->get( 'product_image_zoom' ) != 2) { ?>
			    <script>
			    	$(document).ready(function(){
			    		<?php if($theme_options->get( 'product_image_zoom' ) == 1) { ?>
			    			$('#image').elevateZoom({
			    				zoomType: "inner",
			    				cursor: "pointer",
			    				zoomWindowFadeIn: 500,
			    				zoomWindowFadeOut: 500
			    			});
			    		<?php } else { ?>
				    		$('#image').elevateZoom({
								zoomWindowFadeIn: 500,
								zoomWindowFadeOut: 500,
								zoomWindowOffetx: 20,
								zoomWindowOffety: -1,
								cursor: "pointer",
								lensFadeIn: 500,
								lensFadeOut: 500,
				    		});
			    		<?php } ?>

			    		$('.thumbnails a').click(function() {
			    			var smallImage = $(this).attr('data-image');
			    			var largeImage = $(this).attr('data-zoom-image');
			    			var ez =   $('#image').data('elevateZoom');
			    			$('#ex1').attr('href', largeImage);
			    			ez.swaptheimage(smallImage, largeImage);
			    			return false;
			    		});
			    	});
			    </script>
			    <?php } ?>
			  <?php $image_grid = 4; $product_center_grid = 8;    ?>
			    <div class="col-sm-<?php echo $image_grid; ?> popup-gallery">
			      <div class="row">
			      	  <?php if ($images && $theme_options->get( 'position_image_additional' ) == 2) { ?>
			      	  <div class="col-sm-2">
						<div class="thumbnails thumbnails-left clearfix">
							<ul>
							  <?php if($theme_options->get( 'product_image_zoom' ) != 2 && $thumb) { ?>
						      <li><p><a href="<?php echo $popup; ?>" data-image="<?php echo $thumb; ?>" data-zoom-image="<?php echo $popup; ?>"><img src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a></p></li>
							  <?php } ?>
						      <?php foreach ($images as $image) { ?>
						      <li><p><a style="border-color: red;" href="<?php echo $image['popup']; ?>" data-image="<?php echo $image['popup']; ?>" data-zoom-image="<?php echo $image['popup']; ?>"><img src="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a></p></li>
						      <?php } ?>
						  </ul>
						</div>
			      	  </div>
			      	  <?php } ?>

				      <div class="col-sm-<?php if($theme_options->get( 'position_image_additional' ) == 2) { echo 10; } else { echo 12; } ?>">
				      	<?php if ($thumb) { ?>
					      <div class="product-image <?php if($theme_options->get( 'product_image_zoom' ) != 2) { if($theme_options->get( 'product_image_zoom' ) == 1) { echo 'inner-cloud-zoom'; } else { echo 'cloud-zoom'; } } ?>">
					      	 <?php if($special && $theme_options->get( 'display_text_sale' ) != '0') { ?>
					      	 	<?php $text_sale = 'Sale';
					      	 	if($theme_options->get( 'sale_text', $config->get( 'config_language_id' ) ) != '') {
					      	 		$text_sale = $theme_options->get( 'sale_text', $config->get( 'config_language_id' ) );
					      	 	} ?>
					      	 	<?php if($theme_options->get( 'type_sale' ) == '1') { ?>
					      	 	<?php $product_detail = $theme_options->getDataProduct( $product_id );
					      	 	$roznica_ceny = $product_detail['price']-$product_detail['special'];
					      	 	$procent = ($roznica_ceny*100)/$product_detail['price']; ?>
					      	 	<div class="sale">-<?php echo round($procent); ?>%</div>
					      	 	<?php } else { ?>
					      	 	<div class="sale"><?php echo $text_sale; ?></div>
					      	 	<?php } ?>
					      	 <?php } ?>
							 <?php
							 	$origin = explode("/cache",$popup);
							 	$origin1 = $origin[0] . $origin[1];
							 	$origin2 = explode("-600x800",$origin1);
							 	$origin3 = $origin2[0] . $origin2[1];
							  ?>
					     	 <a href="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>" id="ex1"><img src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" id="image" itemprop="image" data-zoom-image="<?php echo $popup; ?>" /></a>
					      </div>
					  	 <?php } else { ?>
					  	 <div class="product-image">
					  	 	 <img src="image/no_image.jpg" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" id="image" itemprop="image" />
					  	 </div>
					  	 <?php } ?>
				      </div>
					  <script type="text/javascript">
						  $(document).ready(function() {
							  var owl = $("#owl-demo");

							  owl.owlCarousel({
								  items : 4, //10 items above 1000px browser width
								  itemsDesktop : [1000,5], //5 items between 1000px and 901px
								  itemsDesktopSmall : [900,3], // betweem 900px and 601px
								  itemsTablet: [600,2], //2 items between 600 and 0
								  itemsMobile : false // itemsMobile disabled - inherit from itemsTablet option
							  });

							  // Custom Navigation Events
							  $(".lof-next").click(function(){
								  owl.trigger('owl.next');
							  })
							  $(".lof-previous").click(function(){
								  owl.trigger('owl.prev');
							  })
							  $(".play").click(function(){
								  owl.trigger('owl.play',1000); //owl.play event accept autoPlay speed as second parameter
							  })
							  $(".stop").click(function(){
								  owl.trigger('owl.stop');
							  })
						  });
					  </script>
				      <?php if ($images && $theme_options->get( 'position_image_additional' ) != 2) { ?>
				      <div class="col-sm-12">
					      <div class="thumbnails clearfix">
							  <!--yuxing -->
							  <div class="lof-next" onclick="return false"> </div>

							  <div id="owl-demo" class="owl-carousel owl-theme">
								  <?php foreach ($images as $image) { ?>
								  <div class="item">
									  <a href="<?php echo $image['popup']; ?>" data-image="<?php echo $image['popup']; ?>" data-zoom-image="<?php echo $image['popup']; ?>"><img src="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a>
								  </div>
								  <?php } ?>
							  </div>

							  <div class="lof-previous" onclick="return false"> </div>
							  <!-- yuxing
					      	<ul>

					      		<?php if($theme_options->get( 'product_image_zoom' ) != 2 && $thumb) { ?>
					      		<li><p><a href="<?php echo $popup; ?>" data-image="<?php echo $thumb; ?>" data-zoom-image="<?php echo $popup; ?>"><img src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a></p></li>
					      		<?php } ?>
						        <?php foreach ($images as $image) { ?>
						        <li><p><a href="<?php echo $image['popup']; ?>" data-image="<?php echo $image['popup']; ?>" data-zoom-image="<?php echo $image['popup']; ?>"><img src="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a></p></li>
						        <?php } ?>

					        </ul>
					        -->
					      </div>
				      </div>
				      <?php } ?>
			      </div>
			    </div>

			    <div class="col-sm-<?php echo $product_center_grid; ?> product-center clearfix">
			     <div itemprop="offerDetails" itemscope itemtype="http://data-vocabulary.org/Offer">
			      <div class="description">
			        <?php if ($manufacturer) { ?>
			        <span><?php echo $text_manufacturer; ?></span> <a href="<?php echo $manufacturers; ?>" itemprop="brand"><?php echo $manufacturer; ?></a><br />
			        <?php } ?>
			        <span><?php echo $text_model; ?></span> <?php echo $model; ?><br />
			        <?php if ($reward) { ?>
			        <span><?php echo $text_reward; ?></span> <?php echo $reward; ?><br />
			        <?php } ?>
			        <!--yuxing<span><?php echo $text_stock; ?></span> <?php echo $stock; ?>--></div>
			      <?php if ($price) { ?>
			      <div class="price">
			        <?php if (!$special) { ?>
			        <span class="price-new"><span itemprop="price"><?php echo $price; ?></span></span>
			        <?php } else { ?>
			        <span class="price-new price-sale"><span itemprop="price"><?php echo $special; ?></span></span> <span class="price-old"><?php echo $price; ?></span>
			        <?php } ?>
			        <br />
			        <?php if ($tax) { ?>
			        <span class="price-tax"><?php echo $text_tax; ?> <?php echo $tax; ?></span><br />
			        <?php } ?>
			        <?php if ($points) { ?>
			        <span class="reward"><small><?php echo $text_points; ?> <?php echo $points; ?></small></span><br />
			        <?php } ?>
			        <?php if ($discounts) { ?>
			        <br />
			        <div class="discount">
			          <?php foreach ($discounts as $discount) { ?>
			          <?php echo $discount['quantity']; ?><?php echo $text_discount; ?><?php echo $discount['price']; ?><br />
			          <?php } ?>
			        </div>
			        <?php } ?>
			      </div>
			      <?php } ?>
			     </div>

			     <div id="product">
			      <?php if ($options) { ?>
			      <div class="options" style="width:90%;background: none repeat scroll 0 0 #F7F7F7;border: 1px solid #E3E3E3;margin-bottom: 15px">
			        <!--<h2><?php echo $text_option; ?></h2>-->
			        <?php foreach ($options as $option) { ?>
			        <?php if ($option['type'] == 'select') { ?>
			        <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>" style="width:70%;margin-left:10px">
			          <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
			          <select name="option[<?php echo $option['product_option_id']; ?>]" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control">
						  <option value=""><?php echo $text_select; ?></option>
						  <?php foreach ($option['product_option_value'] as $option_value) { ?>
			            <option value="<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
			            <?php if ($option_value['price']) { ?>
			            (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
			            <?php } ?>
			            </option>
			            <?php } ?>
			          </select>
			        </div>
			        <?php } ?>
			        <?php if ($option['type'] == 'radio') { ?>
			        <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
			          <label class="control-label"><?php echo $option['name']; ?></label>
			          <div id="input-option<?php echo $option['product_option_id']; ?>">
			            <?php foreach ($option['product_option_value'] as $option_value) { ?>
			            <div class="radio">
			              <label>
			                <input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" />
			                <?php echo $option_value['name']; ?>
			                <?php if ($option_value['price']) { ?>
			                (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
			                <?php } ?>
			              </label>
			            </div>
			            <?php } ?>
			          </div>
			        </div>
			        <?php } ?>
			        <?php if ($option['type'] == 'checkbox') { ?>
			        <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
			          <label class="control-label"><?php echo $option['name']; ?></label>
			          <div id="input-option<?php echo $option['product_option_id']; ?>">
			            <?php foreach ($option['product_option_value'] as $option_value) { ?>
			            <div class="checkbox">
			              <label>
			                <input type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" />
			                <?php echo $option_value['name']; ?>
			                <?php if ($option_value['price']) { ?>
			                (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
			                <?php } ?>
			              </label>
			            </div>
			            <?php } ?>
			          </div>
			        </div>
			        <?php } ?>
			        <?php if ($option['type'] == 'image') { ?>
			        <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
			          <label class="control-label"><?php echo $option['name']; ?></label>
			          <div id="input-option<?php echo $option['product_option_id']; ?>">
			            <?php foreach ($option['product_option_value'] as $option_value) { ?>
			            <div class="radio">
			              <label>
			                <input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" />
			                <img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" class="img-thumbnail" /> <?php echo $option_value['name']; ?>
			                <?php if ($option_value['price']) { ?>
			                (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
			                <?php } ?>
			              </label>
			            </div>
			            <?php } ?>
			          </div>
			        </div>
			        <?php } ?>
			        <?php if ($option['type'] == 'text') { ?>
			        <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
			          <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
			          <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
			        </div>
			        <?php } ?>
			        <?php if ($option['type'] == 'textarea') { ?>
			        <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
			          <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
			          <textarea name="option[<?php echo $option['product_option_id']; ?>]" rows="5" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control"><?php echo $option['value']; ?></textarea>
			        </div>
			        <?php } ?>
			        <?php if ($option['type'] == 'file') { ?>
			        <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
			          <label class="control-label"><?php echo $option['name']; ?></label>
			          <button type="button" id="button-upload<?php echo $option['product_option_id']; ?>" class="button btn-block"><i class="fa fa-upload"></i> <?php echo $button_upload; ?></button>
			          <input type="hidden" name="option[<?php echo $option['product_option_id']; ?>]" value="" id="input-option<?php echo $option['product_option_id']; ?>" />
			        </div>
			        <?php } ?>
			        <?php if ($option['type'] == 'date') { ?>
			        <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
			          <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
			          <div class="input-group date">
			            <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-format="YYYY-MM-DD" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
			            <span class="input-group-btn">
			            <button class="button" type="button" style="margin-left: 10px;"><i class="fa fa-calendar"></i></button>
			            </span></div>
			        </div>
			        <?php } ?>
			        <?php if ($option['type'] == 'datetime') { ?>
			        <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
			          <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
			          <div class="input-group datetime">
			            <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-format="YYYY-MM-DD HH:mm" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
			            <span class="input-group-btn">
			            <button class="button" type="button" style="margin-left: 10px;"><i class="fa fa-calendar"></i></button>
			            </span></div>
			        </div>
			        <?php } ?>
			        <?php if ($option['type'] == 'time') { ?>
			        <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
			          <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
			          <div class="input-group time">
			            <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-format="HH:mm" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
			            <span class="input-group-btn">
			            <button class="button" type="button" style="margin-left: 10px;"><i class="fa fa-calendar"></i></button>
			            </span></div>
			        </div>
			        <?php } ?>
			        <?php } ?>
			      </div>
			      <?php } ?>

			      <?php if ($recurrings) { ?>
			      <div class="options">
			          <h2><?php echo $text_payment_recurring ?></h2>
			          <div class="form-group required">
			            <select name="recurring_id" class="form-control">
			              <option value=""><?php echo $text_select; ?></option>
			              <?php foreach ($recurrings as $recurring) { ?>
			              <option value="<?php echo $recurring['recurring_id'] ?>"><?php echo $recurring['name'] ?></option>
			              <?php } ?>
			            </select>
			            <div class="help-block" id="recurring-description"></div>
			          </div>
			      </div>
			      <?php } ?>


						<div class="cart">
			        <div class="add-to-cart clearfix">
			          <p><?php echo $entry_qty; ?></p>
			          <div class="quantity">
				          <input type="text" name="quantity" id="quantity_wanted" size="2" value="<?php echo $minimum; ?>" />
				           <a href="#" id="q_up"><i class="fa fa-plus"></i></a>
				          <a href="#" id="q_down"><i class="fa fa-minus"></i></a>
			          </div>
			          <input type="hidden" name="product_id" size="2" value="<?php echo $product_id; ?>" />
			          &nbsp;
						<?php if($theme_options->get( 'display_add_to_cart' ) != '0' ) { ?>
							<div class="cart-holder">
								<input type="button" value="<?php if($theme_options->get( 'add_to_cart_text', $config->get( 'config_language_id' ) ) != '') { echo $theme_options->get( 'add_to_cart_text', $config->get( 'config_language_id' ) ); } else { echo 'Add to cart'; } ?>" id="button-cart" rel="<?php echo $product_id; ?>" class="button" />
								<a href="<?php echo "http://$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]"; ?>" class="button" id="button-more-details"><?php if($theme_options->get( 'more_details_text', $config->get( 'config_language_id' ) ) != '') { echo html_entity_decode($theme_options->get( 'more_details_text', $config->get( 'config_language_id' ) )); } else { echo 'More details'; } ?></a>
							</div>
						<?php } ?>

						<?php if($theme_options->get( 'display_add_to_compare' ) != '0') { ?>
							<div class="compare-holder">
								<a onclick="compare.add('<?php echo $product_id; ?>');" title="<?php if($theme_options->get( 'add_to_compare_text', $config->get( 'config_language_id' ) ) != '') { echo $theme_options->get( 'add_to_compare_text', $config->get( 'config_language_id' ) ); } else { echo 'Add to compare'; } ?>" class="fa  fa-external-link product-icon"></a>
							</div>

						<?php } ?>

						<?php if($theme_options->get( 'display_add_to_wishlist' ) != '0' ) { ?>

							<div class="wishlist-holder">
								<a onclick="wishlist.add('<?php echo $product_id; ?>');" title="<?php if($theme_options->get( 'add_to_wishlist_text', $config->get( 'config_language_id' ) ) != '') { echo $theme_options->get( 'add_to_wishlist_text', $config->get( 'config_language_id' ) ); } else { echo 'Add to wishlist'; } ?>" class="fa fa-heart-o product-icon"></a>


							</div>
						<?php } ?>

					</div>



							<?php if ($minimum > 1) { ?>
							<div class="minimum"><?php echo $text_minimum; ?></div>
							<?php } ?>
						</div>

			     </div><!-- End #product -->
			      <?php if ($review_status) { ?>
			      <div class="review">
			      	<?php if($rating > 0) { ?>
			      	<span itemprop="review" class="hidden" itemscope itemtype="http://data-vocabulary.org/Review-aggregate">
			      		<span itemprop="itemreviewed"><?php echo $heading_title; ?></span>
			      		<span itemprop="rating"><?php echo $rating; ?></span>
			      		<span itemprop="votes"><?php preg_match_all('/\(([0-9]+)\)/', $tab_review, $wyniki);
			      		if(isset($wyniki[1][0])) { echo $wyniki[1][0]; } else { echo 0; } ?></span>
			      	</span>
			      	<?php } ?>
			        <div class="rating"><i class="fa fa-star<?php if($rating >= 1) { echo ' active'; } ?>"></i><i class="fa fa-star<?php if($rating >= 2) { echo ' active'; } ?>"></i><i class="fa fa-star<?php if($rating >= 3) { echo ' active'; } ?>"></i><i class="fa fa-star<?php if($rating >= 4) { echo ' active'; } ?>"></i><i class="fa fa-star<?php if($rating >= 5) { echo ' active'; } ?>"></i>&nbsp;&nbsp;&nbsp;<a onclick="$('a[href=\'#tab-review\']').trigger('click');"><?php echo $reviews; ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="$('a[href=\'#tab-review\']').trigger('click');"><?php echo $text_write; ?></a></div>
			        <?php if($theme_options->get( 'product_social_share' ) == '0') { ?>
							<div class="share">
			        	<!-- AddThis Button BEGIN -->
			        	<div class="addthis_toolbox addthis_default_style">
                                                                        <a class="addthis_button_pinterest_pinit" pi:pinit:layout="horizontal"></a>
									<a class="addthis_button_facebook_like" fb:like:layout="button_count"></a>
									<a class="addthis_button_google_plusone" g:plusone:size="medium"></a>
									<a class="addthis_button_tweet"></a>
									<a class="addthis_counter addthis_pill_style"></a>
								</div>
			        	<script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-515eeaf54693130e"></script>
			        	<!-- AddThis Button END -->
			        </div>
			        <?php } ?>
			      </div>
			      <?php } ?>

					<!--by yuxing start-->
					<div class="ship">
						<span>
						<em class="icon-tailoring"></em>
						<?php if ($breadcrumbs[1]['text']== "Wedding Dresses") {?>
							<a href="javascript:void(0)" class="tailoring-time">Tailoring Time</a>:&nbsp;12-18 Days
						<?php }else{?>
							<a href="javascript:void(0)" class="tailoring-time">Tailoring Time</a>:&nbsp;10-15 Days
						<?php }?>
						<span class="hide" id="timeTip">
						<span class="arrow"></span>
							Whether you choose a standard size or custom measurements, our tailors craft each dress to order.
						</span>
						</span>
						<span class="pointer" style="margin-left:35px;">
						<em class="icon-shipping"></em>
							<a href="javascript:void(0)" class="shipping-time">Shipping Time</a>:&nbsp;3-5 Days
							<span class="hide" id="timeTip" style="width:168px;">
							<span class="arrow"></span>
							* Expedited Shipping: 3-6 Days<br>* Standard Shipping: 5-8 Days<br></span>
						</span>
					</div>
					<!--by yuxing end-->

		    	</div>

				<!--yuxing -->
        <?php
        $ads_right = $modules->getModules('ads_right');

        if( count($ads_right)) { ?>
        <div class="col-sm-13 row">
          <?php
          foreach ($ads_right as $module) {
            echo $module;
          }
          ?>
        </div>
        <?php } ?>

				<!--yuxing -->
		    </div>
    	</div>

    	<?php if($theme_options->get( 'custom_block', 'product_page', $config->get( 'config_language_id' ), 'status' ) == 1) { ?>
    	<div class="col-sm-3">
    		<div class="product-block">
    			<?php if($theme_options->get( 'custom_block', 'product_page', $config->get( 'config_language_id' ), 'heading' ) != '') { ?>
    			<h4 class="title-block"><?php echo $theme_options->get( 'custom_block', 'product_page', $config->get( 'config_language_id' ), 'heading' ); ?></h4>
    			<div class="strip-line"></div>
    			<?php } ?>
    			<div class="block-content">
    				<?php echo html_entity_decode($theme_options->get( 'custom_block', 'product_page', $config->get( 'config_language_id' ), 'text' )); ?>
    			</div>
    		</div>
    	</div>
    	<?php } ?>
    </div>
  </div>
  <?php
  	  $language_id = $config->get( 'config_language_id' );
	  $tabs = array();

	  $tabs[] = array(
	  	'heading' => $tab_description,
	  	'content' => 'description',
	  	'sort' => 1
	  );

	$tabs[] = array(
	'heading' => $tab_shippingmethods,
	'content' => 'shippingmethods',
	'sort' => 2
	);

	$tabs[] = array(
	'heading' => $tab_sizechart,
	'content' => 'sizechart',
	'sort' => 3
	);

	$tabs[] = array(
	'heading' => $tab_colorchart,
	'content' => 'colorchart',
	'sort' => 4
	);

	$tabs[] = array(
	'heading' => $tab_measure,
	'content' => 'measure',
	'sort' => 5
	);


/*	 yuxing
	if ($attribute_groups) {
		  $tabs[] = array(
		  	'heading' => $tab_attribute,
		  	'content' => 'attribute',
		  	'sort' => 3
		  );
	  }
	*/

	  if ($review_status) {
	  	  $tabs[] = array(
	  	  	'heading' => $tab_review,
	  	  	'content' => 'review',
	  	  	'sort' => 6
	  	  );
	  }


	  usort($tabs, "cmp_by_optionNumber");
  ?>
  <div id="tabs" class="htabs">
  	<?php $i = 0; foreach($tabs as $tab) { $i++;
  		$id = 'tab_'.$i;
  		if($tab['content'] == 'description') { $id = 'tab-description'; }
  		/*yuxing
  		if($tab['content'] == 'attribute') { $id = 'tab-attribute'; }
  		*/
  		if($tab['content'] == 'shippingmethods') { $id = 'tab-shippingmethods'; }
  		if($tab['content'] == 'sizechart') { $id = 'tab-sizechart'; }
  		if($tab['content'] == 'colorchart') { $id = 'tab-colorchart'; }
  		if($tab['content'] == 'measure') { $id = 'tab-measure'; }
  		if($tab['content'] == 'review') { $id = 'tab-review'; }
  		echo '<a href="#'.$id.'">'.$tab['heading'].'</a>';
  	} ?>
  </div>
  <?php $i = 0; foreach($tabs as $tab) { $i++;
  	$id = 'tab_'.$i;
  	if($tab['content'] != 'description' && $tab['content'] != 'shippingmethods' && $tab['content'] != 'sizechart' && $tab['content'] != 'colorchart' && $tab['content'] != 'measure' && $tab['content'] != 'review') {
  		echo '<div id="'.$id.'" class="tab-content">'.$tab['content'].'</div>';
  	}
  } ?>
<style type="text/css">
	h3 {font-size:15px; margin:0; padding:5px 0}
	#sizechart table {border:1px solid #ddd; border-width:0 0 1px 1px; margin:5px 0 15px 0; width:100%;}
	#sizechart table td {border:1px solid #ddd; border-width:1px 1px 0 0; padding:2px; text-align:center; color:#333;}
	#sizechart .yellow_bg {background-color:#E7E6EE; font-weight:bold;}
	#sizechart p font{font-size:12px;}
	#size-chart .dark_bg {
		background-color: #EEEEEE;
		font-weight: bold;
	}
	table.table_all{-moz-border-bottom-colors:none;-moz-border-image:none;-moz-border-left-colors:none;-moz-border-right-colors:none;-moz-border-top-colors:none;border-color:#DDDDDD;border-spacing:0;border-style:solid;border-width:1px 1px 0 0;color:#000000;font-size:11px;font-family:Arial;line-height:20px}
	.attr_table_gray{text-align:center}
	.attr_table_gray td{padding:2px}
	.table_all td{-moz-border-bottom-colors:none;-moz-border-image:none;-moz-border-left-colors:none;-moz-border-right-colors:none;-moz-border-top-colors:none;border-color:#DDDDDD;border-style:solid;border-width:0 0 1px 1px}
	.b{font-weight:bold}
	.lit_gray_bg{background-color:#F2F2F2}
	.lit_pink_bg{background-color:#e6e6e6}
	.lit_lightpink_bg{background-color:#ebebeb}
	.svp{ width:794px; margin-left:50px;color:#000;font-size:12px; line-height:50px;padding-top:20px;}
	.svp b{ font-size:21px; margin-right:6px;}
	.svp a{ text-decoration:underline;color:#000; }
	.svp a:hover,.dressul li a:hover{ color:#ef244c;}
	.atop{ float:right;color:#000;}
	.cdl{ width:auto; margin-left:70px; margin-top:10px; margin-bottom:200px ;}
	.cdl dt img{display:block;height:157px;padding:10px;width:157px;}
	.cdl dt,.cdl dd{ float:left;}
	.cdl dt{ font-size:12px; text-align:center; line-height:24px; width:180px; margin-right:200px; background:url(http://s.ericdress.com/images/loading_img.gif) no-repeat 50% 40%; height:180px; }
	.cdl dt, .cdl dd {float: left;}
	#Satin_chiffon, #Composite_Silk, #Dchiffion,#satin, #chiffon, #taffeta, #organza, #matte_satin, #elastic_woven_satin, #silk_like_satin {position: relative;}
	#Satin_chiffon div, #Composite_Silk div, #Dchiffion div,#satin div, #chiffon div, #taffeta div, #organza div, #matte_satin div, #elastic_woven_satin div, #silk_like_satin div {background: none repeat scroll 0 0 #FFFFFF;cursor: pointer;height: 36px;position: absolute;width: 36px;}

</style>
<script type="text/javascript">
	function getSrc(name) {
		filename = "http://s.ericdress.com/images/" + name + ".jpg";
		return filename
	}
	function setSelect(obj){
		obj.parentNode.previousElementSibling.childNodes[2].textContent=obj.attributes['title'].nodeValue;
		obj.parentNode.previousElementSibling.childNodes[1].src="http://www.missydress.co.uk/skin/frontend/default/missydress/color-chart/" + obj.attributes['to'].nodeValue + ".jpg";
	}
</script>

<div id="tab-description" class="tab-content" itemprop="description"><?php echo $description; ?></div>
<div id="tab-sizechart" class="tab-content" itemprop="sizechart">
	<div class="hr"></div>
	<div class="clear"></div>
	<p><font size="2"> The size charts below show the measurements for all our standard clothing. Be sure to compare your measurements to these charts in order to ensure your made-to-order dress fits! Just pay extra $9.99, any dress on bellasdress also can be tailored to your custom measurements.</font></p>
	<h3 style="margin-top: 0cm; margin-right: 0cm; margin-bottom: 0.0001pt; margin-left: 0cm; "><font color="#333333" style="font-size: 12pt; background-image: none; background-attachment: scroll; background-origin: initial; background-clip: initial; background-color: white; background-position: 0% 0%; background-repeat: repeat repeat; ">Dresses Size Chart</font></h3>
	<!--20131009-->
	<table style="border-style='solid'" width="100%" border="0" class="table_all attr_table_gray mceItemTable attr_table_yellow">
		<tbody>
		<tr>
			<td class="lit_gray_bg">US Size</td>
			<td style="background-color: rgb(255, 255, 255);" colspan="2">2</td>
			<td style="background-color: rgb(255, 255, 255);" colspan="2">4</td>
			<td style="background-color: rgb(255, 255, 255);" colspan="2">6</td>
			<td style="background-color: rgb(255, 255, 255);" colspan="2">8</td>
			<td style="background-color: rgb(255, 255, 255);" colspan="2">10</td>
			<td style="background-color: rgb(255, 255, 255);" colspan="2">12</td>
			<td style="background-color: rgb(255, 255, 255);" colspan="2">14</td>
			<td style="background-color: rgb(255, 255, 255);" colspan="2">16</td>
		</tr>
		<tr>
			<td class="lit_gray_bg">UK Size</td>
			<td style="background-color: rgb(255, 255, 255);" colspan="2">6</td>
			<td style="background-color: rgb(255, 255, 255);" colspan="2">8</td>
			<td style="background-color: rgb(255, 255, 255);" colspan="2">10</td>
			<td style="background-color: rgb(255, 255, 255);" colspan="2">12</td>
			<td style="background-color: rgb(255, 255, 255);" colspan="2">14</td>
			<td style="background-color: rgb(255, 255, 255);" colspan="2">16</td>
			<td style="background-color: rgb(255, 255, 255);" colspan="2">18</td>
			<td style="background-color: rgb(255, 255, 255);" colspan="2">20</td>
		</tr>
		<tr>
			<td class="lit_gray_bg">Europe Size</td>
			<td style="background-color: rgb(255, 255, 255);" colspan="2">32</td>
			<td style="background-color: rgb(255, 255, 255);" colspan="2">34</td>
			<td style="background-color: rgb(255, 255, 255);" colspan="2">36</td>
			<td style="background-color: rgb(255, 255, 255);" colspan="2">36</td>
			<td style="background-color: rgb(255, 255, 255);" colspan="2">40</td>
			<td style="background-color: rgb(255, 255, 255);" colspan="2">42</td>
			<td style="background-color: rgb(255, 255, 255);" colspan="2">44</td>
			<td style="background-color: rgb(255, 255, 255);" colspan="2">46</td>
		</tr>
		<tr>
			<td class="lit_gray_bg">&nbsp;</td>
			<td style="background-color: rgb(255, 255, 255);">inch</td>
			<td class="lit_gray_bg">cm</td>
			<td style="background-color: rgb(255, 255, 255);">inch</td>
			<td class="lit_gray_bg">cm</td>
			<td style="background-color: rgb(255, 255, 255);">inch</td>
			<td class="lit_gray_bg">cm</td>
			<td style="background-color: rgb(255, 255, 255);">inch</td>
			<td class="lit_gray_bg">cm</td>
			<td style="background-color: rgb(255, 255, 255);">inch</td>
			<td class="lit_gray_bg">cm</td>
			<td style="background-color: rgb(255, 255, 255);">inch</td>
			<td class="lit_gray_bg">cm</td>
			<td style="background-color: rgb(255, 255, 255);">inch</td>
			<td class="lit_gray_bg">cm</td>
			<td style="background-color: rgb(255, 255, 255);">inch</td>
			<td class="lit_gray_bg">cm</td>
		</tr>
		<tr>
			<td class="lit_gray_bg">Bust</td>
			<td style="background-color: rgb(255, 255, 255);">32 ½</td>
			<td class="lit_gray_bg">83</td>
			<td style="background-color: rgb(255, 255, 255);">33 ½</td>
			<td class="lit_gray_bg">84</td>
			<td style="background-color: rgb(255, 255, 255);">34 ½</td>
			<td class="lit_gray_bg">88</td>
			<td style="background-color: rgb(255, 255, 255);">35 ½</td>
			<td class="lit_gray_bg">90</td>
			<td style="background-color: rgb(255, 255, 255);">36 ½</td>
			<td class="lit_gray_bg">93</td>
			<td style="background-color: rgb(255, 255, 255);">38</td>
			<td class="lit_gray_bg">97</td>
			<td style="background-color: rgb(255, 255, 255);">39 ½</td>
			<td class="lit_gray_bg">100</td>
			<td style="background-color: rgb(255, 255, 255);">41</td>
			<td class="lit_gray_bg">104</td>
		</tr>
		<tr>
			<td class="lit_gray_bg">Waist</td>
			<td style="background-color: rgb(255, 255, 255);">25 ½</td>
			<td class="lit_gray_bg">65</td>
			<td style="background-color: rgb(255, 255, 255);">26 ½</td>
			<td class="lit_gray_bg">68</td>
			<td style="background-color: rgb(255, 255, 255);">27 ½</td>
			<td class="lit_gray_bg">70</td>
			<td style="background-color: rgb(255, 255, 255);">28 ½</td>
			<td class="lit_gray_bg">72</td>
			<td style="background-color: rgb(255, 255, 255);">29 ½</td>
			<td class="lit_gray_bg">75</td>
			<td style="background-color: rgb(255, 255, 255);">31</td>
			<td class="lit_gray_bg">79</td>
			<td style="background-color: rgb(255, 255, 255);">32 ½</td>
			<td class="lit_gray_bg">83</td>
			<td style="background-color: rgb(255, 255, 255);">34</td>
			<td class="lit_gray_bg">86</td>
		</tr>
		<tr>
			<td class="lit_gray_bg">Hips</td>
			<td style="background-color: rgb(255, 255, 255);">35 ¾</td>
			<td class="lit_gray_bg">91</td>
			<td style="background-color: rgb(255, 255, 255);">36 ¾</td>
			<td class="lit_gray_bg">92</td>
			<td style="background-color: rgb(255, 255, 255);">37 ¾</td>
			<td class="lit_gray_bg">96</td>
			<td style="background-color: rgb(255, 255, 255);">38 ¾</td>
			<td class="lit_gray_bg">98</td>
			<td style="background-color: rgb(255, 255, 255);">39 ¾</td>
			<td class="lit_gray_bg">101</td>
			<td style="background-color: rgb(255, 255, 255);">41 ¼</td>
			<td class="lit_gray_bg">105</td>
			<td style="background-color: rgb(255, 255, 255);">42 ¾</td>
			<td class="lit_gray_bg">109</td>
			<td style="background-color: rgb(255, 255, 255);">44 ¼</td>
			<td class="lit_gray_bg">112</td>
		</tr>
		<tr>
			<td class="lit_gray_bg">Hollow to Floor</td>
			<td style="background-color: rgb(255, 255, 255);">58</td>
			<td class="lit_gray_bg">147</td>
			<td style="background-color: rgb(255, 255, 255);">58</td>
			<td class="lit_gray_bg">147</td>
			<td style="background-color: rgb(255, 255, 255);">59</td>
			<td class="lit_gray_bg">150</td>
			<td style="background-color: rgb(255, 255, 255);">59</td>
			<td class="lit_gray_bg">150</td>
			<td style="background-color: rgb(255, 255, 255);">60</td>
			<td class="lit_gray_bg">152</td>
			<td style="background-color: rgb(255, 255, 255);">60</td>
			<td class="lit_gray_bg">152</td>
			<td style="background-color: rgb(255, 255, 255);">61</td>
			<td class="lit_gray_bg">155</td>
			<td style="background-color: rgb(255, 255, 255);">61</td>
			<td class="lit_gray_bg">155</td>
		</tr>

		</tbody>
	</table>

	<!--20131009-->
	<h3>Plus Size Dresses Size Chart</h3>
	<table width="100%" border="0" class="table_all attr_table_gray mceItemTable attr_table_yellow">
		<tbody>

		<tr>
			<td class="lit_gray_bg">US Size</td>
			<td colspan="2" style="background-color: rgb(255, 255, 255);">16W</td>
			<td colspan="2" style="background-color: rgb(255, 255, 255);">18W</td>
			<td colspan="2" style="background-color: rgb(255, 255, 255);">20W</td>
			<td colspan="2" style="background-color: rgb(255, 255, 255);">22W</td>
			<td colspan="2" style="background-color: rgb(255, 255, 255);">24W</td>
			<td colspan="2" style="background-color: rgb(255, 255, 255);">26W</td>
		</tr>
		<tr>
			<td class="lit_gray_bg">UK Size</td>
			<td colspan="2" style="background-color: rgb(255, 255, 255);">22</td>
			<td colspan="2" style="background-color: rgb(255, 255, 255);">24</td>
			<td colspan="2" style="background-color: rgb(255, 255, 255);">26</td>
			<td colspan="2" style="background-color: rgb(255, 255, 255);">28</td>
			<td colspan="2" style="background-color: rgb(255, 255, 255);">30</td>
			<td colspan="2" style="background-color: rgb(255, 255, 255);">32</td>
		</tr>
		<tr>
			<td class="lit_gray_bg">Europe Size</td>
			<td colspan="2" style="background-color: rgb(255, 255, 255);">48</td>
			<td colspan="2" style="background-color: rgb(255, 255, 255);">50</td>
			<td colspan="2" style="background-color: rgb(255, 255, 255);">52</td>
			<td colspan="2" style="background-color: rgb(255, 255, 255);">54</td>
			<td colspan="2" style="background-color: rgb(255, 255, 255);">56</td>
			<td colspan="2" style="background-color: rgb(255, 255, 255);">58</td>
		</tr>
		<tr>
			<td class="lit_gray_bg">&nbsp;</td>
			<td style="background-color: rgb(255, 255, 255);">inch</td>
			<td class="lit_gray_bg">cm</td>
			<td style="background-color: rgb(255, 255, 255);">inch</td>
			<td class="lit_gray_bg">cm</td>
			<td style="background-color: rgb(255, 255, 255);">inch</td>
			<td class="lit_gray_bg">cm</td>
			<td style="background-color: rgb(255, 255, 255);">inch</td>
			<td class="lit_gray_bg">cm</td>
			<td style="background-color: rgb(255, 255, 255);">inch</td>
			<td class="lit_gray_bg">cm</td>
			<td style="background-color: rgb(255, 255, 255);">inch</td>
			<td class="lit_gray_bg">cm</td>
		</tr>
		<tr>

			<td class="lit_gray_bg">Bust</td>
			<td style="background-color: rgb(255, 255, 255);">43</td>
			<td class="lit_gray_bg">109 </td>
			<td style="background-color: rgb(255, 255, 255);">45</td>
			<td class="lit_gray_bg">114 </td>
			<td style="background-color: rgb(255, 255, 255);">47</td>
			<td class="lit_gray_bg">119 </td>
			<td style="background-color: rgb(255, 255, 255);">49</td>
			<td class="lit_gray_bg">124 </td>
			<td style="background-color: rgb(255, 255, 255);">51</td>
			<td class="lit_gray_bg">130 </td>
			<td style="background-color: rgb(255, 255, 255);">53</td>
			<td class="lit_gray_bg">135 </td>
		</tr>

		<tr>
			<td class="lit_gray_bg">Waist</td>
			<td style="background-color: rgb(255, 255, 255);">36    ¼ </td>
			<td class="lit_gray_bg">92 </td>
			<td style="background-color: rgb(255, 255, 255);">38    ½ </td>
			<td class="lit_gray_bg">98 </td>
			<td style="background-color: rgb(255, 255, 255);">40    ¾ </td>
			<td class="lit_gray_bg">104 </td>
			<td style="background-color: rgb(255, 255, 255);">43</td>
			<td class="lit_gray_bg">109 </td>
			<td style="background-color: rgb(255, 255, 255);">45    ¼ </td>
			<td class="lit_gray_bg">115 </td>
			<td style="background-color: rgb(255, 255, 255);">47    ½</td>
			<td class="lit_gray_bg">121 </td>

		</tr>
		<tr>
			<td class="lit_gray_bg">Hips</td>
			<td style="background-color: rgb(255, 255, 255);">45    ½ </td>
			<td class="lit_gray_bg">116 </td>
			<td style="background-color: rgb(255, 255, 255);">47    ½ </td>
			<td class="lit_gray_bg">121 </td>
			<td style="background-color: rgb(255, 255, 255);">49    ½ </td>
			<td class="lit_gray_bg">126 </td>
			<td style="background-color: rgb(255, 255, 255);">51    ½ </td>
			<td class="lit_gray_bg">131 </td>
			<td style="background-color: rgb(255, 255, 255);">53    ½ </td>
			<td class="lit_gray_bg">136 </td>
			<td style="background-color: rgb(255, 255, 255);">55    ½</td>
			<td class="lit_gray_bg">141 </td>
		</tr>
		<tr>
			<td class="lit_gray_bg">Hollow to Floor</td>
			<td style="background-color: rgb(255, 255, 255);">61</td>
			<td class="lit_gray_bg">155 </td>
			<td style="background-color: rgb(255, 255, 255);">61</td>
			<td class="lit_gray_bg">155 </td>
			<td style="background-color: rgb(255, 255, 255);">61</td>
			<td class="lit_gray_bg">155 </td>
			<td style="background-color: rgb(255, 255, 255);">61</td>
			<td class="lit_gray_bg">155 </td>
			<td style="background-color: rgb(255, 255, 255);">61</td>
			<td class="lit_gray_bg">155 </td>
			<td style="background-color: rgb(255, 255, 255);">61</td>
			<td class="lit_gray_bg">155 </td>

		</tr>

		</tbody>
	</table>
	<h3>Flower Girl Dresses Size Chart</h3>
	<!--20131009-->
	<table width="100%" border="0" class="table_all attr_table_gray mceItemTable attr_table_yellow">
		<tbody>
		<tr>
			<td class="lit_gray_bg">Size</td>
			<td colspan="2" style="background-color: rgb(255, 255, 255);">Child 2</td>
			<td colspan="2" style="background-color: rgb(255, 255, 255);">Child 3</td>
			<td colspan="2" style="background-color: rgb(255, 255, 255);">Child 4</td>
			<td colspan="2" style="background-color: rgb(255, 255, 255);">Child 5</td>
			<td colspan="2" style="background-color: rgb(255, 255, 255);">Child 6</td>
			<td colspan="2" style="background-color: rgb(255, 255, 255);">Child 7</td>
			<td colspan="2" style="background-color: rgb(255, 255, 255);">Child 8</td>
			<td colspan="2" style="background-color: rgb(255, 255, 255);">Child 9</td>
			<td colspan="2" style="background-color: rgb(255, 255, 255);">Child 10</td>
			<td colspan="2" style="background-color: rgb(255, 255, 255);">Child 11</td>
			<td colspan="2" style="background-color: rgb(255, 255, 255);">Child 12</td>
			<td colspan="2" style="background-color: rgb(255, 255, 255);">Child 13</td>
			<td colspan="2" style="background-color: rgb(255, 255, 255);">Child 14</td>

		</tr>
		<tr>
			<td class="lit_gray_bg">&nbsp;</td>
			<td style="background-color: rgb(255, 255, 255);">inch</td>
			<td class="lit_gray_bg">cm</td>
			<td style="background-color: rgb(255, 255, 255);">inch</td>
			<td class="lit_gray_bg">cm</td>
			<td style="background-color: rgb(255, 255, 255);">inch</td>
			<td class="lit_gray_bg">cm</td>
			<td style="background-color: rgb(255, 255, 255);">inch</td>
			<td class="lit_gray_bg">cm</td>
			<td style="background-color: rgb(255, 255, 255);">inch</td>
			<td class="lit_gray_bg">cm</td>
			<td style="background-color: rgb(255, 255, 255);">inch</td>
			<td class="lit_gray_bg">cm</td>
			<td style="background-color: rgb(255, 255, 255);">inch</td>
			<td class="lit_gray_bg">cm</td>
			<td style="background-color: rgb(255, 255, 255);">inch</td>
			<td class="lit_gray_bg">cm</td>
			<td style="background-color: rgb(255, 255, 255);">inch</td>
			<td class="lit_gray_bg">cm</td>
			<td style="background-color: rgb(255, 255, 255);">inch</td>
			<td class="lit_gray_bg">cm</td>
			<td style="background-color: rgb(255, 255, 255);">inch</td>
			<td class="lit_gray_bg">cm</td>
			<td style="background-color: rgb(255, 255, 255);">inch</td>
			<td class="lit_gray_bg">cm</td>
			<td style="background-color: rgb(255, 255, 255);">inch</td>
			<td class="lit_gray_bg">cm</td>
		</tr>
		<tr>

			<td class="lit_gray_bg">Bust</td>
			<td style="background-color: rgb(255, 255, 255);">21</td>
			<td class="lit_gray_bg">53</td>
			<td style="background-color: rgb(255, 255, 255);">22</td>
			<td class="lit_gray_bg">56</td>
			<td style="background-color: rgb(255, 255, 255);">23</td>
			<td class="lit_gray_bg">58</td>
			<td style="background-color: rgb(255, 255, 255);">24</td>
			<td class="lit_gray_bg">61</td>
			<td style="background-color: rgb(255, 255, 255);">25</td>
			<td class="lit_gray_bg">64</td>
			<td style="background-color: rgb(255, 255, 255);">26</td>
			<td class="lit_gray_bg">66</td>
			<td style="background-color: rgb(255, 255, 255);">27</td>
			<td class="lit_gray_bg">69</td>
			<td style="background-color: rgb(255, 255, 255);">28</td>
			<td class="lit_gray_bg">71</td>
			<td style="background-color: rgb(255, 255, 255);">29</td>
			<td class="lit_gray_bg">74</td>
			<td style="background-color: rgb(255, 255, 255);">30.5</td>
			<td class="lit_gray_bg">77</td>
			<td style="background-color: rgb(255, 255, 255);">32</td>
			<td class="lit_gray_bg">81</td>
			<td style="background-color: rgb(255, 255, 255);">33</td>
			<td class="lit_gray_bg">84</td>
			<td style="background-color: rgb(255, 255, 255);">34</td>
			<td class="lit_gray_bg">86</td>

		</tr>
		<tr>

			<td class="lit_gray_bg">Waist</td>
			<td style="background-color: rgb(255, 255, 255);">20</td>
			<td class="lit_gray_bg">51</td>
			<td style="background-color: rgb(255, 255, 255);">21</td>
			<td class="lit_gray_bg">53</td>
			<td style="background-color: rgb(255, 255, 255);">22</td>
			<td class="lit_gray_bg">56</td>
			<td style="background-color: rgb(255, 255, 255);">23</td>
			<td class="lit_gray_bg">58</td>
			<td style="background-color: rgb(255, 255, 255);">24</td>
			<td class="lit_gray_bg">61</td>
			<td style="background-color: rgb(255, 255, 255);">25</td>
			<td class="lit_gray_bg">65</td>
			<td style="background-color: rgb(255, 255, 255);">26</td>
			<td class="lit_gray_bg">66</td>
			<td style="background-color: rgb(255, 255, 255);">27</td>
			<td class="lit_gray_bg">69</td>
			<td style="background-color: rgb(255, 255, 255);">28</td>
			<td class="lit_gray_bg">71</td>
			<td style="background-color: rgb(255, 255, 255);">29</td>
			<td class="lit_gray_bg">74</td>
			<td style="background-color: rgb(255, 255, 255);">30</td>
			<td class="lit_gray_bg">76</td>
			<td style="background-color: rgb(255, 255, 255);">31</td>
			<td class="lit_gray_bg">79</td>
			<td style="background-color: rgb(255, 255, 255);">32</td>
			<td class="lit_gray_bg">81</td>

		</tr>
		<tr>
			<td class="lit_gray_bg">Hips</td>
			<td style="background-color: rgb(255, 255, 255);">20</td>
			<td class="lit_gray_bg">51</td>
			<td style="background-color: rgb(255, 255, 255);">21</td>
			<td class="lit_gray_bg">53</td>
			<td style="background-color: rgb(255, 255, 255);">22</td>
			<td class="lit_gray_bg">56</td>
			<td style="background-color: rgb(255, 255, 255);">23</td>
			<td class="lit_gray_bg">58</td>
			<td style="background-color: rgb(255, 255, 255);">25</td>
			<td class="lit_gray_bg">64</td>
			<td style="background-color: rgb(255, 255, 255);">26</td>
			<td class="lit_gray_bg">66</td>
			<td style="background-color: rgb(255, 255, 255);">27</td>
			<td class="lit_gray_bg">69</td>
			<td style="background-color: rgb(255, 255, 255);">29</td>
			<td class="lit_gray_bg">74</td>
			<td style="background-color: rgb(255, 255, 255);">31</td>
			<td class="lit_gray_bg">79</td>
			<td style="background-color: rgb(255, 255, 255);">33</td>
			<td class="lit_gray_bg">84</td>
			<td style="background-color: rgb(255, 255, 255);">34</td>
			<td class="lit_gray_bg">86</td>
			<td style="background-color: rgb(255, 255, 255);">34.5</td>
			<td class="lit_gray_bg">88</td>
			<td style="background-color: rgb(255, 255, 255);">35</td>
			<td class="lit_gray_bg">89</td>
		</tr>
		<tr>

			<td class="lit_gray_bg">Hollow<br> to Floor</td>
			<td style="background-color: rgb(255, 255, 255);">33</td>
			<td class="lit_gray_bg">84</td>
			<td style="background-color: rgb(255, 255, 255);">35</td>
			<td class="lit_gray_bg">89</td>
			<td style="background-color: rgb(255, 255, 255);">38</td>
			<td class="lit_gray_bg">97</td>
			<td style="background-color: rgb(255, 255, 255);">40</td>
			<td class="lit_gray_bg">102</td>
			<td style="background-color: rgb(255, 255, 255);">41</td>
			<td class="lit_gray_bg">104</td>
			<td style="background-color: rgb(255, 255, 255);">42</td>
			<td class="lit_gray_bg">107</td>
			<td style="background-color: rgb(255, 255, 255);">43</td>
			<td class="lit_gray_bg">109</td>
			<td style="background-color: rgb(255, 255, 255);">44</td>
			<td class="lit_gray_bg">112</td>
			<td style="background-color: rgb(255, 255, 255);">47</td>
			<td class="lit_gray_bg">119</td>
			<td style="background-color: rgb(255, 255, 255);">48</td>
			<td class="lit_gray_bg">122</td>
			<td style="background-color: rgb(255, 255, 255);">50</td>
			<td class="lit_gray_bg">127</td>
			<td style="background-color: rgb(255, 255, 255);">51</td>
			<td class="lit_gray_bg">130</td>
			<td style="background-color: rgb(255, 255, 255);">52</td>
			<td class="lit_gray_bg">132</td>
		</tr>

		</tbody>
	</table>
	<!--20131009-->
	<h3>Junior Bridesmaid Dresses Size Chart</h3>
	<!--20131009-->
	<table width="100%" border="0" class="table_all attr_table_gray mceItemTable attr_table_yellow">
		<tbody>
		<tr>
			<td class="lit_gray_bg">Size</td>
			<td colspan="2" style="background-color: rgb(255, 255, 255);">J4</td>
			<td colspan="2" style="background-color: rgb(255, 255, 255);">J6</td>
			<td colspan="2" style="background-color: rgb(255, 255, 255);">J8</td>
			<td colspan="2" style="background-color: rgb(255, 255, 255);">J10</td>
			<td colspan="2" style="background-color: rgb(255, 255, 255);">J12</td>
			<td colspan="2" style="background-color: rgb(255, 255, 255);">J14</td>
			<td colspan="2" style="background-color: rgb(255, 255, 255);">J16</td>
		</tr>
		<tr>
			<td class="lit_gray_bg"></td>
			<td style="background-color: rgb(255, 255, 255);">inch</td>
			<td class="lit_gray_bg">cm</td>
			<td style="background-color: rgb(255, 255, 255);">inch</td>
			<td class="lit_gray_bg">cm</td>
			<td style="background-color: rgb(255, 255, 255);">inch</td>
			<td class="lit_gray_bg">cm</td>
			<td style="background-color: rgb(255, 255, 255);">inch</td>
			<td class="lit_gray_bg">cm</td>
			<td style="background-color: rgb(255, 255, 255);">inch</td>
			<td class="lit_gray_bg">cm</td>
			<td style="background-color: rgb(255, 255, 255);">inch</td>
			<td class="lit_gray_bg">cm</td>
			<td style="background-color: rgb(255, 255, 255);">inch</td>
			<td class="lit_gray_bg">cm</td>
		</tr>
		<tr>
			<td class="lit_gray_bg">Bust</td>
			<td style="background-color: rgb(255, 255, 255);">22</td>
			<td class="lit_gray_bg">56</td>
			<td style="background-color: rgb(255, 255, 255);">24</td>
			<td class="lit_gray_bg">61</td>
			<td style="background-color: rgb(255, 255, 255);">26</td>
			<td class="lit_gray_bg">66</td>
			<td style="background-color: rgb(255, 255, 255);">28</td>
			<td class="lit_gray_bg">71</td>
			<td style="background-color: rgb(255, 255, 255);">30</td>
			<td class="lit_gray_bg">76</td>
			<td style="background-color: rgb(255, 255, 255);">32</td>
			<td class="lit_gray_bg">81</td>
			<td style="background-color: rgb(255, 255, 255);">34</td>
			<td class="lit_gray_bg">86</td>
		</tr>
		<tr>
			<td class="lit_gray_bg">Waist</td>
			<td style="background-color: rgb(255, 255, 255);">20</td>
			<td class="lit_gray_bg">51</td>
			<td style="background-color: rgb(255, 255, 255);">22</td>
			<td class="lit_gray_bg">56</td>
			<td style="background-color: rgb(255, 255, 255);">24</td>
			<td class="lit_gray_bg">61</td>
			<td style="background-color: rgb(255, 255, 255);">26</td>
			<td class="lit_gray_bg">66</td>
			<td style="background-color: rgb(255, 255, 255);">28</td>
			<td class="lit_gray_bg">71</td>
			<td style="background-color: rgb(255, 255, 255);">30</td>
			<td class="lit_gray_bg">76</td>
			<td style="background-color: rgb(255, 255, 255);">32</td>
			<td class="lit_gray_bg">81</td>
		</tr>
		<tr>
			<td class="lit_gray_bg">Hips</td>
			<td style="background-color: rgb(255, 255, 255);">25</td>
			<td class="lit_gray_bg">64</td>
			<td style="background-color: rgb(255, 255, 255);">27</td>
			<td class="lit_gray_bg">69</td>
			<td style="background-color: rgb(255, 255, 255);">29</td>
			<td class="lit_gray_bg">74</td>
			<td style="background-color: rgb(255, 255, 255);">31</td>
			<td class="lit_gray_bg">79</td>
			<td style="background-color: rgb(255, 255, 255);">33</td>
			<td class="lit_gray_bg">84</td>
			<td style="background-color: rgb(255, 255, 255);">35</td>
			<td class="lit_gray_bg">89</td>
			<td style="background-color: rgb(255, 255, 255);">37</td>
			<td class="lit_gray_bg">94</td>
		</tr>
		<tr>
			<td class="lit_gray_bg">Hollow to Floor</td>
			<td style="background-color: rgb(255, 255, 255);">42</td>
			<td class="lit_gray_bg">107</td>
			<td style="background-color: rgb(255, 255, 255);">45</td>
			<td class="lit_gray_bg">114</td>
			<td style="background-color: rgb(255, 255, 255);">48</td>
			<td class="lit_gray_bg">122</td>
			<td style="background-color: rgb(255, 255, 255);">50</td>
			<td class="lit_gray_bg">127</td>
			<td style="background-color: rgb(255, 255, 255);">51</td>
			<td class="lit_gray_bg">130</td>
			<td style="background-color: rgb(255, 255, 255);">53</td>
			<td class="lit_gray_bg">135</td>
			<td style="background-color: rgb(255, 255, 255);">55</td>
			<td class="lit_gray_bg">140</td>
		</tr>

		</tbody>
	</table>
	<!--20131009-->
	<h3>Bridal Mini Jackets / Wraps Size Chart</h3>
	<!--<table class="attr_table_yellow mceItemTable" border="0">-->
	<table width="100%" border="0" class="table_all attr_table_gray mceItemTable attr_table_yellow">
		<tbody><tr>

			<td class="big3 b" colspan="17" height="35"><b>Mini Jacket / Wrap  Size</b></td>

		</tr>
		<tr>
			<td class="lit_gray_bg">US Size</td>
			<td colspan="2" style="background-color: rgb(255, 255, 255);">2</td>
			<td colspan="2" style="background-color: rgb(255, 255, 255);">4</td>
			<td colspan="2" style="background-color: rgb(255, 255, 255);">6</td>
			<td colspan="2" style="background-color: rgb(255, 255, 255);">8</td>
			<td colspan="2" style="background-color: rgb(255, 255, 255);">10</td>
			<td colspan="2" style="background-color: rgb(255, 255, 255);">12</td>
			<td colspan="2" style="background-color: rgb(255, 255, 255);">14</td>
			<td colspan="2" style="background-color: rgb(255, 255, 255);">16</td>
		</tr>
		<tr>
			<td class="lit_gray_bg">UK Size</td>
			<td colspan="2" style="background-color: rgb(255, 255, 255);">6</td>
			<td colspan="2" style="background-color: rgb(255, 255, 255);">8</td>
			<td colspan="2" style="background-color: rgb(255, 255, 255);">10</td>
			<td colspan="2" style="background-color: rgb(255, 255, 255);">12</td>
			<td colspan="2" style="background-color: rgb(255, 255, 255);">14</td>
			<td colspan="2" style="background-color: rgb(255, 255, 255);">16</td>
			<td colspan="2" style="background-color: rgb(255, 255, 255);">18</td>
			<td colspan="2" style="background-color: rgb(255, 255, 255);">20</td>
		</tr>
		<tr>
			<td class="lit_gray_bg">Europe Size</td>
			<td colspan="2" style="background-color: rgb(255, 255, 255);">32</td>
			<td colspan="2" style="background-color: rgb(255, 255, 255);">34</td>
			<td colspan="2" style="background-color: rgb(255, 255, 255);">36</td>
			<td colspan="2" style="background-color: rgb(255, 255, 255);">38</td>
			<td colspan="2" style="background-color: rgb(255, 255, 255);">40</td>
			<td colspan="2" style="background-color: rgb(255, 255, 255);">42</td>
			<td colspan="2" style="background-color: rgb(255, 255, 255);">44</td>
			<td colspan="2" style="background-color: rgb(255, 255, 255);">46</td>
		</tr>


		<tr>

			<td class="lit_gray_bg">&nbsp;</td>
			<td style="background-color: rgb(255, 255, 255);">inch</td>
			<td class="lit_gray_bg">cm</td>
			<td style="background-color: rgb(255, 255, 255);">inch</td>
			<td class="lit_gray_bg">cm</td>
			<td style="background-color: rgb(255, 255, 255);">inch</td>
			<td class="lit_gray_bg">cm</td>
			<td style="background-color: rgb(255, 255, 255);">inch</td>
			<td class="lit_gray_bg">cm</td>
			<td style="background-color: rgb(255, 255, 255);">inch</td>
			<td class="lit_gray_bg">cm</td>
			<td style="background-color: rgb(255, 255, 255);">inch</td>
			<td class="lit_gray_bg">cm</td>
			<td style="background-color: rgb(255, 255, 255);">inch</td>
			<td class="lit_gray_bg">cm</td>
			<td style="background-color: rgb(255, 255, 255);">inch</td>
			<td class="lit_gray_bg">cm</td>
		</tr>

		<tr>
			<td class="lit_gray_bg">Bust</td>
			<td style="background-color: rgb(255, 255, 255);">32½</td>
			<td class="lit_gray_bg">83</td>
			<td style="background-color: rgb(255, 255, 255);">33½</td>
			<td class="lit_gray_bg">85</td>
			<td style="background-color: rgb(255, 255, 255);">34½</td>
			<td class="lit_gray_bg">88</td>
			<td style="background-color: rgb(255, 255, 255);">35½</td>
			<td class="lit_gray_bg">90</td>
			<td style="background-color: rgb(255, 255, 255);">36½</td>
			<td class="lit_gray_bg">93</td>
			<td style="background-color: rgb(255, 255, 255);">38</td>
			<td class="lit_gray_bg">97</td>
			<td style="background-color: rgb(255, 255, 255);">39½</td>
			<td class="lit_gray_bg">100</td>
			<td style="background-color: rgb(255, 255, 255);">41</td>
			<td class="lit_gray_bg">104</td>
		</tr>

		<tr>

			<td class="lit_gray_bg">Shoulder to bust</td>
			<td style="background-color: rgb(255, 255, 255);">9¾</td>
			<td class="lit_gray_bg">24½</td>
			<td style="background-color: rgb(255, 255, 255);">10</td>
			<td class="lit_gray_bg">25</td>
			<td style="background-color: rgb(255, 255, 255);">10</td>
			<td class="lit_gray_bg">25½</td>
			<td style="background-color: rgb(255, 255, 255);">10¼</td>
			<td class="lit_gray_bg">26</td>
			<td style="background-color: rgb(255, 255, 255);">10½</td>
			<td class="lit_gray_bg">26½</td>
			<td style="background-color: rgb(255, 255, 255);">10¾</td>
			<td class="lit_gray_bg">27</td>
			<td style="background-color: rgb(255, 255, 255);">11</td>
			<td class="lit_gray_bg">27½</td>
			<td style="background-color: rgb(255, 255, 255);">11</td>
			<td class="lit_gray_bg">28</td>
		</tr>

		<tr>
			<td class="lit_gray_bg">Shoulder to waist</td>
			<td style="background-color: rgb(255, 255, 255);">15¾</td>
			<td class="lit_gray_bg">40</td>
			<td style="background-color: rgb(255, 255, 255);">16¼</td>
			<td class="lit_gray_bg">41</td>
			<td style="background-color: rgb(255, 255, 255);">16½</td>
			<td class="lit_gray_bg">42</td>
			<td style="background-color: rgb(255, 255, 255);">17</td>
			<td class="lit_gray_bg">43</td>
			<td style="background-color: rgb(255, 255, 255);">17½</td>
			<td class="lit_gray_bg">44</td>
			<td style="background-color: rgb(255, 255, 255);">17¾</td>
			<td class="lit_gray_bg">45</td>
			<td style="background-color: rgb(255, 255, 255);">18¼</td>
			<td class="lit_gray_bg">46</td>
			<td style="background-color: rgb(255, 255, 255);">18½</td>
			<td class="lit_gray_bg">47</td>
		</tr>

		<tr>
			<td class="lit_gray_bg">Bust point to bust point</td>
			<td style="background-color: rgb(255, 255, 255);">7</td>
			<td class="lit_gray_bg">17½</td>
			<td style="background-color: rgb(255, 255, 255);">7</td>
			<td class="lit_gray_bg">18</td>
			<td style="background-color: rgb(255, 255, 255);">7½</td>
			<td class="lit_gray_bg">18½</td>
			<td style="background-color: rgb(255, 255, 255);">7½</td>
			<td class="lit_gray_bg">19</td>
			<td style="background-color: rgb(255, 255, 255);">7¾</td>
			<td class="lit_gray_bg">19½</td>
			<td style="background-color: rgb(255, 255, 255);">8</td>
			<td class="lit_gray_bg">20</td>
			<td style="background-color: rgb(255, 255, 255);">8</td>
			<td class="lit_gray_bg">20½</td>
			<td style="background-color: rgb(255, 255, 255);">8¼</td>
			<td class="lit_gray_bg">21</td>
		</tr>

		<tr>
			<td class="lit_gray_bg">Shoulder</td>
			<td style="background-color: rgb(255, 255, 255);">14¾</td>
			<td class="lit_gray_bg">37</td>
			<td style="background-color: rgb(255, 255, 255);">15</td>
			<td class="lit_gray_bg">38</td>
			<td style="background-color: rgb(255, 255, 255);">15</td>
			<td class="lit_gray_bg">38</td>
			<td style="background-color: rgb(255, 255, 255);">15½</td>
			<td class="lit_gray_bg">39 </td>
			<td style="background-color: rgb(255, 255, 255);">15¾</td>
			<td class="lit_gray_bg">40</td>
			<td style="background-color: rgb(255, 255, 255);">16¼</td>
			<td class="lit_gray_bg">41</td>
			<td style="background-color: rgb(255, 255, 255);">16½</td>
			<td class="lit_gray_bg">42</td>
			<td style="background-color: rgb(255, 255, 255);">17</td>
			<td class="lit_gray_bg">43</td>
		</tr>

		<tr>

			<td class="lit_gray_bg">Armhole</td>
			<td style="background-color: rgb(255, 255, 255);">15</td>
			<td class="lit_gray_bg">38</td>
			<td style="background-color: rgb(255, 255, 255);">15½</td>
			<td class="lit_gray_bg">39</td>
			<td style="background-color: rgb(255, 255, 255);">16</td>
			<td class="lit_gray_bg">40½</td>
			<td style="background-color: rgb(255, 255, 255);">16½</td>
			<td class="lit_gray_bg">41½</td>
			<td style="background-color: rgb(255, 255, 255);">16¾</td>
			<td class="lit_gray_bg">42½</td>
			<td style="background-color: rgb(255, 255, 255);">17½</td>
			<td class="lit_gray_bg">44</td>
			<td style="background-color: rgb(255, 255, 255);">18</td>
			<td class="lit_gray_bg">45½</td>
			<td style="background-color: rgb(255, 255, 255);">18½</td>
			<td class="lit_gray_bg">47</td>
		</tr>

		<tr>
			<td class="lit_gray_bg">Sleeve Length</td>
			<td style="background-color: rgb(255, 255, 255);">18</td>
			<td class="lit_gray_bg">45½</td>
			<td style="background-color: rgb(255, 255, 255);">18</td>
			<td class="lit_gray_bg">45½</td>
			<td style="background-color: rgb(255, 255, 255);">18</td>
			<td class="lit_gray_bg">45½</td>
			<td style="background-color: rgb(255, 255, 255);">18</td>
			<td class="lit_gray_bg">45½</td>
			<td style="background-color: rgb(255, 255, 255);">18</td>
			<td class="lit_gray_bg">45½</td>
			<td style="background-color: rgb(255, 255, 255);">18</td>
			<td class="lit_gray_bg">45½</td>
			<td style="background-color: rgb(255, 255, 255);">18</td>
			<td class="lit_gray_bg">45½</td>
			<td style="background-color: rgb(255, 255, 255);">18</td>
			<td class="lit_gray_bg">45½</td>
		</tr>
		</tbody></table><p>
		<br></p>
	<!--<table class="attr_table_yellow mceItemTable" border="0">-->
	<table width="100%" border="0" class="table_all attr_table_gray mceItemTable attr_table_yellow">

		<tbody>
		<tr>
			<td class="lit_gray_bg">US Size</td>
			<td colspan="2" style="background-color: rgb(255, 255, 255);">16W</td>
			<td colspan="2" style="background-color: rgb(255, 255, 255);">18W</td>
			<td colspan="2" style="background-color: rgb(255, 255, 255);">20W</td>
			<td colspan="2" style="background-color: rgb(255, 255, 255);">22W</td>
			<td colspan="2" style="background-color: rgb(255, 255, 255);">24W</td>
			<td colspan="2" style="background-color: rgb(255, 255, 255);">26W</td>
		</tr>
		<tr>
			<td class="lit_gray_bg">UK Size</td>
			<td colspan="2" style="background-color: rgb(255, 255, 255);">22</td>
			<td colspan="2" style="background-color: rgb(255, 255, 255);">24</td>
			<td colspan="2" style="background-color: rgb(255, 255, 255);">26</td>
			<td colspan="2" style="background-color: rgb(255, 255, 255);">28</td>
			<td colspan="2" style="background-color: rgb(255, 255, 255);">30</td>
			<td colspan="2" style="background-color: rgb(255, 255, 255);">32</td>
		</tr>
		<tr>
			<td class="lit_gray_bg">Europe Size</td>
			<td colspan="2" style="background-color: rgb(255, 255, 255);">48</td>
			<td colspan="2" style="background-color: rgb(255, 255, 255);">50</td>
			<td colspan="2" style="background-color: rgb(255, 255, 255);">52</td>
			<td colspan="2" style="background-color: rgb(255, 255, 255);">54</td>
			<td colspan="2" style="background-color: rgb(255, 255, 255);">56</td>
			<td colspan="2" style="background-color: rgb(255, 255, 255);">58</td>
		</tr>

		<tr>
			<td class="lit_gray_bg">&nbsp;</td>
			<td style="background-color: rgb(255, 255, 255);">inch</td>
			<td class="lit_gray_bg">cm</td>
			<td style="background-color: rgb(255, 255, 255);">inch</td>
			<td class="lit_gray_bg">cm</td>
			<td style="background-color: rgb(255, 255, 255);">inch</td>
			<td class="lit_gray_bg">cm</td>
			<td style="background-color: rgb(255, 255, 255);">inch</td>
			<td class="lit_gray_bg">cm</td>
			<td style="background-color: rgb(255, 255, 255);">inch</td>
			<td class="lit_gray_bg">cm</td>
			<td style="background-color: rgb(255, 255, 255);">inch</td>
			<td class="lit_gray_bg">cm</td>
		</tr>

		<tr>
			<td class="lit_gray_bg">Bust</td>
			<td style="background-color: rgb(255, 255, 255);">43</td>
			<td class="lit_gray_bg">109</td>
			<td style="background-color: rgb(255, 255, 255);">45 </td>
			<td class="lit_gray_bg">114</td>
			<td style="background-color: rgb(255, 255, 255);">47</td>
			<td class="lit_gray_bg">119</td>
			<td style="background-color: rgb(255, 255, 255);">49</td>
			<td class="lit_gray_bg">124</td>
			<td style="background-color: rgb(255, 255, 255);">51</td>
			<td class="lit_gray_bg">130</td>
			<td style="background-color: rgb(255, 255, 255);">53</td>
			<td class="lit_gray_bg">135</td>
		</tr>

		<tr>

			<td class="lit_gray_bg">Shoulder to bust</td>
			<td style="background-color: rgb(255, 255, 255);">11½</td>
			<td class="lit_gray_bg">29    </td>
			<td style="background-color: rgb(255, 255, 255);">11¾</td>
			<td class="lit_gray_bg">29½</td>
			<td style="background-color: rgb(255, 255, 255);">12</td>
			<td class="lit_gray_bg">30    </td>

			<td style="background-color: rgb(255, 255, 255);">12¼</td>
			<td class="lit_gray_bg">31    </td>
			<td style="background-color: rgb(255, 255, 255);">12¼</td>
			<td class="lit_gray_bg">31    </td>
			<td style="background-color: rgb(255, 255, 255);">12½</td>
			<td class="lit_gray_bg">31½</td>
		</tr>

		<tr>
			<td class="lit_gray_bg">Shoulder to waist</td>
			<td style="background-color: rgb(255, 255, 255);">19½</td>
			<td class="lit_gray_bg">49</td>
			<td style="background-color: rgb(255, 255, 255);">19¾</td>
			<td class="lit_gray_bg">50</td>
			<td style="background-color: rgb(255, 255, 255);">20    </td>
			<td class="lit_gray_bg">51</td>
			<td style="background-color: rgb(255, 255, 255);">20½</td>
			<td class="lit_gray_bg">52</td>
			<td style="background-color: rgb(255, 255, 255);">21    </td>
			<td class="lit_gray_bg">53½</td>
			<td style="background-color: rgb(255, 255, 255);">21½</td>
			<td class="lit_gray_bg">54½</td>
		</tr>

		<tr>
			<td class="lit_gray_bg">Bust point to bust point</td>
			<td style="background-color: rgb(255, 255, 255);">8¾</td>
			<td class="lit_gray_bg">22</td>
			<td style="background-color: rgb(255, 255, 255);">9</td>
			<td class="lit_gray_bg">22½</td>
			<td style="background-color: rgb(255, 255, 255);">9</td>
			<td class="lit_gray_bg">23</td>
			<td style="background-color: rgb(255, 255, 255);">9¼</td>
			<td class="lit_gray_bg">23½</td>
			<td style="background-color: rgb(255, 255, 255);">10¼</td>
			<td class="lit_gray_bg">26</td>
			<td style="background-color: rgb(255, 255, 255);">10¾</td>
			<td class="lit_gray_bg">27</td>
		</tr>

		<tr>
			<td class="lit_gray_bg">Shoulder</td>
			<td style="background-color: rgb(255, 255, 255);">17¾</td>
			<td class="lit_gray_bg">45</td>
			<td style="background-color: rgb(255, 255, 255);">18¼</td>
			<td class="lit_gray_bg">46</td>
			<td style="background-color: rgb(255, 255, 255);">18½</td>
			<td class="lit_gray_bg">47</td>
			<td style="background-color: rgb(255, 255, 255);">19</td>
			<td class="lit_gray_bg">48</td>
			<td style="background-color: rgb(255, 255, 255);">19</td>
			<td class="lit_gray_bg">48</td>
			<td style="background-color: rgb(255, 255, 255);">19½</td>
			<td class="lit_gray_bg">49</td>
		</tr>

		<tr>
			<td class="lit_gray_bg">Armhole</td>
			<td style="background-color: rgb(255, 255, 255);">19½</td>
			<td class="lit_gray_bg">49</td>
			<td style="background-color: rgb(255, 255, 255);">20½</td>
			<td class="lit_gray_bg">52</td>
			<td style="background-color: rgb(255, 255, 255);">20¾</td>
			<td class="lit_gray_bg">52½</td>
			<td style="background-color: rgb(255, 255, 255);">21½</td>
			<td class="lit_gray_bg">54½</td>
			<td style="background-color: rgb(255, 255, 255);">20¾</td>
			<td class="lit_gray_bg">52½</td>
			<td style="background-color: rgb(255, 255, 255);">21½</td>
			<td class="lit_gray_bg">54½</td>
		</tr>

		<tr>
			<td class="lit_gray_bg">Sleeve Length</td>
			<td style="background-color: rgb(255, 255, 255);">18</td>
			<td class="lit_gray_bg">45½</td>
			<td style="background-color: rgb(255, 255, 255);">18½</td>
			<td class="lit_gray_bg">47</td>
			<td style="background-color: rgb(255, 255, 255);">19</td>
			<td class="lit_gray_bg">48½</td>
			<td style="background-color: rgb(255, 255, 255);">19</td>
			<td class="lit_gray_bg">48½</td>
			<td style="background-color: rgb(255, 255, 255);">19½</td>
			<td class="lit_gray_bg">49</td>
			<td style="background-color: rgb(255, 255, 255);">19 ½</td>
			<td class="lit_gray_bg">49 ½</td>
		</tr>
		</tbody></table>


</div>
<div id="tab-colorchart" class="tab-content" itemprop="colorchart">
	<div id="color-Organza" class="clear">
		<p class="svp">
			<strong>Organza</strong>
		</p>
		<dl class="cdl">
			<dt>
				<img src="http://www.missydress.co.uk/skin/frontend/default/missydress/color-chart/Organza/Daffodil.jpg">
				Daffodil
			</dt>
			<dd id="organza" class="color-chart-focus">
				<img src="http://www.missydress.co.uk/skin/frontend/default/missydress/color-chart/Organza.jpg">
				<div onclick="setSelect(this)" to="Organza/Brown" title="Brown" style="left: 16px; top: 1px; opacity: 0; background-color: rgb(255, 255, 255);"></div>
			<div onclick="setSelect(this)" to="Organza/Black" title="Black" style="left: 84px; top: 1px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Organza/Blue" title="Blue" style="left: 152px; top: 1px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Organza/Champagne" title="Champagne" style="left: 220px; top: 1px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Organza/Chocolate" title="Chocolate" style="left: 288px; top: 1px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Organza/Burgundy" title="Burgundy" style="left: 356px; top: 1px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Organza/Daffodil" title="Daffodil" style="left: 424px; top: 1px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Organza/Dark_Navy" title="Dark Navy" style="left: 16px; top: 57px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Organza/Dark_Green" title="Dark Green" style="left: 84px; top: 57px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Organza/Fuchsia" title="Fuchsia" style="left: 152px; top: 57px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Organza/Gold" title="Gold" style="left: 220px; top: 57px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Organza/Grape" title="Grape" style="left: 288px; top: 57px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Organza/Green" title="Green" style="left: 356px; top: 57px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Organza/Hunter" title="Hunter" style="left: 424px; top: 57px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Organza/Ivory" title="Ivory" style="left: 16px; top: 113px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Organza/Lavender" title="Lavender" style="left: 84px; top: 113px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Organza/Pearl_Pink" title="Pearl Pink" style="left: 152px; top: 113px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Organza/Light_Sky_Blue" title="Light Sky Blue" style="left: 220px; top: 113px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Organza/Lilac" title="Lilac" style="left: 288px; top: 113px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Organza/Orange" title="Orange" style="left: 356px; top: 113px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Organza/Pink" title="Pink" style="left: 424px; top: 113px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Organza/Red" title="Red" style="left: 16px; top: 169px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Organza/Royal_Blue" title="Royal Blue" style="left: 84px; top: 169px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Organza/Sage" title="Sage" style="left: 152px; top: 169px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Organza/Silver" title="Silver" style="left: 220px; top: 169px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Organza/White" title="White" style="left: 288px; top: 169px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Organza/Regency" title="Regency" style="left: 356px; top: 169px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Organza/Watermelon" title="Watermelon" style="left: 424px; top: 169px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			</dd>
		</dl>
	</div>
	<div class="clear">
		&nbsp;
	</div>
	<div id="color-Chiffon" class="clear">
		<p class="svp">
			<strong>Chiffon</strong>
		</p>
		<dl class="cdl">
			<dt>
				<img src="http://www.missydress.co.uk/skin/frontend/default/missydress/color-chart/Chiffon/Daffodil.jpg">
				Daffodil
			</dt>
			<dd id="chiffon"><img src="http://www.missydress.co.uk/skin/frontend/default/missydress/color-chart/Chiffon.jpg">
			<div onclick="setSelect(this)" to="Chiffon/Black" title="Black" style="left: 16px; top: 1px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Chiffon/Blue" title="Blue" style="left: 84px; top: 1px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Chiffon/Brown" title="Brown" style="left: 152px; top: 1px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Chiffon/Burgundy" title="Burgundy" style="left: 220px; top: 1px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Chiffon/Champagne" title="Champagne" style="left: 288px; top: 1px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Chiffon/Chocolate" title="Chocolate" style="left: 356px; top: 1px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Chiffon/Dark_Navy" title="Dark Navy" style="left: 424px; top: 1px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Chiffon/Daffodil" title="Daffodil" style="left: 16px; top: 57px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Chiffon/Dark_Green" title="Dark Green" style="left: 84px; top: 57px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Chiffon/Fuchsia" title="Fuchsia" style="left: 152px; top: 57px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Chiffon/Gold" title="Gold" style="left: 220px; top: 57px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Chiffon/Grape" title="Grape" style="left: 288px; top: 57px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Chiffon/Green" title="Green" style="left: 356px; top: 57px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Chiffon/Hunter" title="Hunter" style="left: 424px; top: 57px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Chiffon/Ivory" title="Ivory" style="left: 16px; top: 113px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Chiffon/Lavender" title="Lavender" style="left: 84px; top: 113px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Chiffon/Pearl_Pink" title="Pearl Pink" style="left: 152px; top: 113px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Chiffon/Light_Sky_Blue" title="Light Sky Blue" style="left: 220px; top: 113px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Chiffon/Lilac" title="Lilac" style="left: 288px; top: 113px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Chiffon/Orange" title="Orange" style="left: 356px; top: 113px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Chiffon/Pink" title="Pink" style="left: 424px; top: 113px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Chiffon/Royal_Blue" title="Royal Blue" style="left: 16px; top: 169px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Chiffon/Sage" title="Sage" style="left: 84px; top: 169px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Chiffon/Red" title="Red" style="left: 152px; top: 169px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Chiffon/Silver" title="Silver" style="left: 220px; top: 169px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Chiffon/White" title="White" style="left: 288px; top: 169px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Chiffon/Regency" title="Regency" style="left: 356px; top: 169px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Chiffon/Watermelon" title="Watermelon" style="left: 424px; top: 169px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			</dd>
		</dl>
	</div>
	<div class="clear">
		&nbsp;
	</div>
	<div id="color_elastic_woven_satin">
		<p class="svp">
			<strong>Elastic Woven Satin</strong>
		</p>
		<dl class="cdl">
			<dt>
				<img src="http://www.missydress.co.uk/skin/frontend/default/missydress/color-chart/Elastic-Woven-Satin/Daffodil.jpg">
				Daffodil
			</dt>
			<dd id="elastic_woven_satin" class="color-chart-focus"><img src="http://www.missydress.co.uk/skin/frontend/default/missydress/color-chart/Elastic-Woven-Satin.jpg">
			<div onclick="setSelect(this)" to="Elastic-Woven-Satin/Daffodil" title="Daffodil" style="left: 16px; top: 1px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Elastic-Woven-Satin/Orange" title="Orange" style="left: 84px; top: 1px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Elastic-Woven-Satin/Pink" title="Pink" style="left: 152px; top: 1px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Elastic-Woven-Satin/Fuchsia" title="Fuchsia" style="left: 220px; top: 1px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Elastic-Woven-Satin/Red" title="Red" style="left: 288px; top: 1px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Elastic-Woven-Satin/Burgundy" title="Burgundy" style="left: 356px; top: 1px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Elastic-Woven-Satin/Lilac" title="Lilac" style="left: 424px; top: 1px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Elastic-Woven-Satin/Lavender" title="Lavender" style="left: 16px; top: 57px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Elastic-Woven-Satin/Grape" title="Grape" style="left: 84px; top: 57px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Elastic-Woven-Satin/Light_Sky_Blue" title="Light Sky Blue" style="left: 152px; top: 57px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Elastic-Woven-Satin/Blue" title="Blue" style="left: 220px; top: 57px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Elastic-Woven-Satin/Royal_Blue" title="Royal Blue" style="left: 288px; top: 57px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Elastic-Woven-Satin/Dark_Navy" title="Dark Navy" style="left: 356px; top: 57px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Elastic-Woven-Satin/Sage" title="Sage" style="left: 424px; top: 57px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Elastic-Woven-Satin/Green" title="Green" style="left: 16px; top: 113px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Elastic-Woven-Satin/Hunter" title="Hunter" style="left: 84px; top: 113px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Elastic-Woven-Satin/Dark_Green" title="Dark Green" style="left: 152px; top: 113px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Elastic-Woven-Satin/Brown" title="Brown" style="left: 220px; top: 113px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Elastic-Woven-Satin/Chocolate" title="Chocolate" style="left: 288px; top: 113px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Elastic-Woven-Satin/White" title="White" style="left: 356px; top: 113px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Elastic-Woven-Satin/Ivory" title="Ivory" style="left: 424px; top: 113px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Elastic-Woven-Satin/Champagne" title="Champagne" style="left: 16px; top: 169px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Elastic-Woven-Satin/Gold" title="Gold" style="left: 84px; top: 169px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Elastic-Woven-Satin/Silver" title="Silver" style="left: 152px; top: 169px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Elastic-Woven-Satin/Black" title="Black" style="left: 220px; top: 169px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Elastic-Woven-Satin/Pearl_Pink" title="Pearl Pink" style="left: 288px; top: 169px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Elastic-Woven-Satin/Watermelon" title="Watermelon" style="left: 356px; top: 169px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Elastic-Woven-Satin/Regency" title="Regency" style="left: 424px; top: 169px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			</dd>
		</dl>
	</div>
	<div class="clear">
		&nbsp;
	</div>
	<div id="color_matte_satin">
		<p class="svp">
			<strong>Matte Satin</strong>
		</p>
		<dl class="cdl">
			<dt>
				<img src="http://www.missydress.co.uk/skin/frontend/default/missydress/color-chart/Matte-Satin/Daffodil.jpg">
				Daffodil
			</dt>
			<dd id="matte_satin" class="color-chart-focus"><img src="http://www.missydress.co.uk/skin/frontend/default/missydress/color-chart/Matte-Satin.jpg">
			<div onclick="setSelect(this)" to="Matte-Satin/Daffodil" title="Daffodil" style="left: 16px; top: 1px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Matte-Satin/Orange" title="Orange" style="left: 84px; top: 1px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Matte-Satin/Pink" title="Pink" style="left: 152px; top: 1px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Matte-Satin/Fuchsia" title="Fuchsia" style="left: 220px; top: 1px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Matte-Satin/Red" title="Red" style="left: 288px; top: 1px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Matte-Satin/Burgundy" title="Burgundy" style="left: 356px; top: 1px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Matte-Satin/Lilac" title="Lilac" style="left: 424px; top: 1px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Matte-Satin/Lavender" title="Lavender" style="left: 16px; top: 57px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Matte-Satin/Grape" title="Grape" style="left: 84px; top: 57px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Matte-Satin/Light_Sky_Blue" title="Light Sky Blue" style="left: 152px; top: 57px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Matte-Satin/Blue" title="Blue" style="left: 220px; top: 57px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Matte-Satin/Royal_Blue" title="Royal Blue" style="left: 288px; top: 57px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Matte-Satin/Dark_Navy" title="Dark Navy" style="left: 356px; top: 57px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Matte-Satin/Sage" title="Sage" style="left: 424px; top: 57px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Matte-Satin/Green" title="Green" style="left: 16px; top: 113px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Matte-Satin/Hunter" title="Hunter" style="left: 84px; top: 113px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Matte-Satin/Dark_Green" title="Dark Green" style="left: 152px; top: 113px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Matte-Satin/Brown" title="Brown" style="left: 220px; top: 113px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Matte-Satin/Chocolate" title="Chocolate" style="left: 288px; top: 113px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Matte-Satin/White" title="White" style="left: 356px; top: 113px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Matte-Satin/Ivory" title="Ivory" style="left: 424px; top: 113px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Matte-Satin/Champagne" title="Champagne" style="left: 16px; top: 169px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Matte-Satin/Gold" title="Gold" style="left: 84px; top: 169px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Matte-Satin/Silver" title="Silver" style="left: 152px; top: 169px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Matte-Satin/Black" title="Black" style="left: 220px; top: 169px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Matte-Satin/Pearl_Pink" title="Pearl Pink" style="left: 288px; top: 169px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Matte-Satin/Watermelon" title="Watermelon" style="left: 356px; top: 169px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Matte-Satin/Regency" title="Regency" style="left: 424px; top: 169px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			</dd>
		</dl>
	</div>
	<div class="clear">
		&nbsp;
	</div>
	<div id="color_satin">
		<p class="svp">
			<strong>Satin</strong>
		</p>
		<dl class="cdl">
			<dt>
				<img src="http://www.missydress.co.uk/skin/frontend/default/missydress/color-chart/Satin/Daffodil.jpg">
				Daffodil
			</dt>
			<dd id="satin" class="color-chart-focus"><img src="http://www.missydress.co.uk/skin/frontend/default/missydress/color-chart/Satin.jpg">
			<div onclick="setSelect(this)" to="Satin/Daffodil" title="Daffodil" style="left: 16px; top: 1px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Satin/Orange" title="Orange" style="left: 84px; top: 1px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Satin/Pink" title="Pink" style="left: 152px; top: 1px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Satin/Fuchsia" title="Fuchsia" style="left: 220px; top: 1px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Satin/Red" title="Red" style="left: 288px; top: 1px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Satin/Burgundy" title="Burgundy" style="left: 356px; top: 1px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Satin/Lilac" title="Lilac" style="left: 424px; top: 1px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Satin/Lavender" title="Lavender" style="left: 16px; top: 57px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Satin/Grape" title="Grape" style="left: 84px; top: 57px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Satin/Light_Sky_Blue" title="Light Sky Blue" style="left: 152px; top: 57px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Satin/Blue" title="Blue" style="left: 220px; top: 57px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Satin/Royal_Blue" title="Royal Blue" style="left: 288px; top: 57px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Satin/Dark_Navy" title="Dark Navy" style="left: 356px; top: 57px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Satin/Sage" title="Sage" style="left: 424px; top: 57px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Satin/Green" title="Green" style="left: 16px; top: 113px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Satin/Hunter" title="Hunter" style="left: 84px; top: 113px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Satin/Dark_Green" title="Dark Green" style="left: 152px; top: 113px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Satin/Brown" title="Brown" style="left: 220px; top: 113px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Satin/Chocolate" title="Chocolate" style="left: 288px; top: 113px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Satin/White" title="White" style="left: 356px; top: 113px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Satin/Ivory" title="Ivory" style="left: 424px; top: 113px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Satin/Champagne" title="Champagne" style="left: 16px; top: 169px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Satin/Gold" title="Gold" style="left: 84px; top: 169px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Satin/Silver" title="Silver" style="left: 152px; top: 169px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Satin/Black" title="Black" style="left: 220px; top: 169px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Satin/Pearl_Pink" title="Pearl Pink" style="left: 288px; top: 169px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Satin/Watermelon" title="Watermelon" style="left: 356px; top: 169px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Satin/Regency" title="Regency" style="left: 424px; top: 169px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			</dd>
		</dl>
	</div>
	<div class="clear">
		&nbsp;
	</div>
	<div id="color_silk_like_satin">
		<p class="svp">
			<strong>Silk Like Satin</strong>
		</p>
		<dl class="cdl">
			<dt>
				<img src="http://www.missydress.co.uk/skin/frontend/default/missydress/color-chart/Silk-Like-Satin/Daffodil.jpg">
				Daffodil
			</dt>
			<dd id="silk_like_satin" class="color-chart-focus"><img src="http://www.missydress.co.uk/skin/frontend/default/missydress/color-chart/Silk-Like-Satin.jpg">
			<div onclick="setSelect(this)" to="Silk-Like-Satin/Daffodil" title="Daffodil" style="left: 16px; top: 1px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Silk-Like-Satin/Orange" title="Orange" style="left: 84px; top: 1px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Silk-Like-Satin/Pink" title="Pink" style="left: 152px; top: 1px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Silk-Like-Satin/Fuchsia" title="Fuchsia" style="left: 220px; top: 1px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Silk-Like-Satin/Red" title="Red" style="left: 288px; top: 1px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Silk-Like-Satin/Burgundy" title="Burgundy" style="left: 356px; top: 1px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Silk-Like-Satin/Lilac" title="Lilac" style="left: 424px; top: 1px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Silk-Like-Satin/Lavender" title="Lavender" style="left: 16px; top: 57px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Silk-Like-Satin/Grape" title="Grape" style="left: 84px; top: 57px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Silk-Like-Satin/Light_Sky_Blue" title="Light Sky Blue" style="left: 152px; top: 57px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Silk-Like-Satin/Blue" title="Blue" style="left: 220px; top: 57px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Silk-Like-Satin/Royal_Blue" title="Royal Blue" style="left: 288px; top: 57px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Silk-Like-Satin/Dark_Navy" title="Dark Navy" style="left: 356px; top: 57px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Silk-Like-Satin/Sage" title="Sage" style="left: 424px; top: 57px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Silk-Like-Satin/Green" title="Green" style="left: 16px; top: 113px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Silk-Like-Satin/Hunter" title="Hunter" style="left: 84px; top: 113px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Silk-Like-Satin/Dark_Green" title="Dark Green" style="left: 152px; top: 113px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Silk-Like-Satin/Brown" title="Brown" style="left: 220px; top: 113px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Silk-Like-Satin/Chocolate" title="Chocolate" style="left: 288px; top: 113px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Silk-Like-Satin/White" title="White" style="left: 356px; top: 113px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Silk-Like-Satin/Ivory" title="Ivory" style="left: 424px; top: 113px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Silk-Like-Satin/Champagne" title="Champagne" style="left: 16px; top: 169px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Silk-Like-Satin/Gold" title="Gold" style="left: 84px; top: 169px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Silk-Like-Satin/Silver" title="Silver" style="left: 152px; top: 169px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Silk-Like-Satin/Black" title="Black" style="left: 220px; top: 169px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Silk-Like-Satin/Pearl_Pink" title="Pearl Pink" style="left: 288px; top: 169px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Silk-Like-Satin/Watermelon" title="Watermelon" style="left: 356px; top: 169px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Silk-Like-Satin/Regency" title="Regency" style="left: 424px; top: 169px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			</dd>
		</dl>
	</div>
	<div class="clear">
		&nbsp;
	</div>
	<div id="color_taffeta">
		<p class="svp">
			<strong>Taffeta</strong>
		</p>
		<dl class="cdl">
			<dt>
				<img src="http://www.missydress.co.uk/skin/frontend/default/missydress/color-chart/Taffeta/Daffodil.jpg">
				Daffodil
			</dt>
			<dd id="taffeta" class="color-chart-focus"><img src="http://www.missydress.co.uk/skin/frontend/default/missydress/color-chart/Taffeta.jpg">
			<div onclick="setSelect(this)" to="Taffeta/Brown" title="Brown" style="left: 16px; top: 1px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Taffeta/Burgundy" title="Burgundy" style="left: 84px; top: 1px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Taffeta/Black" title="Black" style="left: 152px; top: 1px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Taffeta/Blue" title="Blue" style="left: 220px; top: 1px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Taffeta/Champagne" title="Champagne" style="left: 288px; top: 1px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Taffeta/Chocolate" title="Chocolate" style="left: 356px; top: 1px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Taffeta/Daffodil" title="Daffodil" style="left: 424px; top: 1px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Taffeta/Dark_Green" title="Dark Green" style="left: 16px; top: 57px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Taffeta/Dark_Navy" title="Dark Navy" style="left: 84px; top: 57px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Taffeta/Fuchsia" title="Fuchsia" style="left: 152px; top: 57px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Taffeta/Gold" title="Gold" style="left: 220px; top: 57px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Taffeta/Grape" title="Grape" style="left: 288px; top: 57px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Taffeta/Green" title="Green" style="left: 356px; top: 57px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Taffeta/Hunter" title="Hunter" style="left: 424px; top: 57px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Taffeta/Ivory" title="Ivory" style="left: 16px; top: 113px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Taffeta/Lavender" title="Lavender" style="left: 84px; top: 113px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Taffeta/Pearl_Pink" title="Pearl Pink" style="left: 152px; top: 113px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Taffeta/Light_Sky_Blue" title="Light Sky Blue" style="left: 220px; top: 113px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Taffeta/Lilac" title="Lilac" style="left: 288px; top: 113px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Taffeta/Orange" title="Orange" style="left: 356px; top: 113px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Taffeta/Pink" title="Pink" style="left: 424px; top: 113px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Taffeta/Red" title="Red" style="left: 16px; top: 169px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Taffeta/Royal_Blue" title="Royal Blue" style="left: 84px; top: 169px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Taffeta/Sage" title="Sage" style="left: 152px; top: 169px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Taffeta/Silver" title="Silver" style="left: 220px; top: 169px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Taffeta/White" title="White" style="left: 288px; top: 169px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Taffeta/Regency" title="Regency" style="left: 356px; top: 169px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			<div onclick="setSelect(this)" to="Taffeta/Watermelon" title="Watermelon" style="left: 424px; top: 169px; opacity: 0; background-color: rgb(255, 255, 255);">
			</div>
			</dd>
		</dl>
	</div>
	<div class="clear">
		&nbsp;
	</div>
</div>
<div id="tab-shippingmethods" class="tab-content" itemprop="shippingmethods">
	<p style="display:inline" class="wedpt">Shipping Information for </p><h3 style="display:inline">Tailor-Made Dresses</h3><p></p>
	<p class="wedp">You will always get personally tailored dresses from us no matter you choose a standard size or give us your custom measurements. Shipping time is different for different items. </p>
	<p class="wedptit" style="margin-bottom: 2px;"><h3>Shipping Time</h3></p>
	<p class="wedp">Shipping Time is the time taken for the finished dress to be shipped to you. </p>
	<p class="wedptit" style="margin-bottom: 2px;"><h3>Formal Dresses</h3></p>
	<p class="wedp">Generally speaking, it will take 10-15 calendar days for professional dressmaker to tailor your dresses. Then it will take EMS about 3-5 working days for the finished dresses to travel from our country to the destination.</p>
	<img src="image/catalog/shippingmethods/promdressprocessingtime.jpg" alt="" title="" class="wedimgbg">
	<p class="wedptit" style="margin-bottom: 2px;"><h3>Wedding Dresses</h3></p>
	<p class="wedp">Generally speaking, it will take 12-18 calendar days for professional dressmaker to tailor your dresses. Also it will take EMS about 3-5 working days for the finished dresses to travel from our country to the destination.</p>
	<img src="image/catalog/shippingmethods/weddingdressprocessingtime.jpg" alt="" title="" class="wedimgbg">
	<p class="wedptit" style="margin-bottom: 2px;"><h3>The Statement for Urgent Orders</h3></p>
	<p class="wedp">For the free shipping items on our website, we usually ship them out by Standard Shipping. Generally speaking, it will take Standard Shipping about 2-8 working days to ship out the items. But if you need your items urgently, please select Expedited Shipping(It's about 2-5 working days and not free on our website). Select your country as&nbsp; shipping destination, and then, pay for the shipping fee, so that we can ship out your items ASAP</p>
	<p class="wedp">&nbsp;</p>
	</li>
</div>
<div id="tab-measure" class="tab-content" itemprop="measure">
	<p style="margin: 5px 0; line-height: 165%;">Measure with undergarments similar to those you will wear with your dress; Do not measure over other clothing. Make sure the measuring tape is parallel to the floor and pulled evenly across the body with no slack. You may want to consider getting professionally measured.</p>
	<!-- How To Measure -->
	<table>
		<tbody>
		<tr>
			<td colspan="4">
				<h4>Standard Dresses</h4>
			</td>
		</tr>
		<tr>
			<td width="33%"><img width="250px" alt="How to Measure bust" src="image/catalog/measurement/bust_003.jpg"></td>
			<td width="33%"><img width="250px" alt="How to Measure waist" src="image/catalog/measurement/waist.jpg"></td>
			<td width="33%"><img width="250px" alt="How to Measure hips" src="image/catalog/measurement/hips_002.jpg"></td>
		</tr>
		<tr>
			<td><strong>Bust</strong><br> *This is not your bra size!<br> *Wear a bra<br> *Relax arms at sides<br> *Pull tape across the fullest part of the bust</td>
			<td><strong>Waist</strong><br> *Find the natural waist<br> *This is the smallest part of the waist<br> *Usually about 1 in. above belly button<br> *Keep tape slightly loose to <br>allow for breathing room</td>
			<td><strong>Hips</strong><br> *Find the widest part of the hips<br> *Usually about 7 in. below natural waist<br> *Tape should brush across both hipbones</td>
		</tr>
		<tr>
			<td width="33%"><img width="250px" alt="How to Measure shoulder width" src="image/catalog/measurement/shoulder_width.jpg"></td>
			<td width="33%"><img width="250px" alt="How to Measure hollow to floor" src="image/catalog/measurement/hollow_to_floor_003.jpg"></td>
			<td width="33%"><img width="250px" alt="How to Measure height" src="image/catalog/measurement/height_002.jpg"></td>
		</tr>
		<tr>
			<td><strong>Shoulder</strong><br>Shoulder - From the edge of the shoulder socket, measure across the back to the same point on the other shoulder.</td>
			<td><strong>Hollow to Floor (Bare Foot)</strong><br> *Stand straight with feet together <br> *Measure in bare feet<br> *Begin at the hollow space <br>between the collarbones and<br> pull tape straight down to the floor<br> *To fit high heels, we’ll add<br>an extra 5 cm onto custom-sized<br>floor-length dresses and dresses with trains</td>
			<td><strong>Height</strong><br> * Stand straight with feet together<br> * Measure in bare feet<br> * Begin at the top of the head and <br>pull tape straight down to the floor</td>
		</tr>
		</tbody>
	</table>
	<table>
		<tbody>
		<tr>
			<td colspan="4" class="hr">&nbsp;</td>
		</tr>
		<tr>
			<td colspan="4">
				<h4>Maternity Dresses</h4>
			</td>
		</tr>
		<tr>
			<td width="25%"><img width="250px" alt="How to Measure upper bust" src="image/catalog/measurement/upper_bust.jpg"></td>
			<td width="25%"><img width="250px" alt="How to Measure bust" src="image/catalog/measurement/bust_002.jpg"></td>
			<td width="25%"><img width="250px" alt="How to Measure under bust" src="image/catalog/measurement/under_bust.jpg"></td>
			<td width="25%"><img width="250px" alt="How to Measure around belly" src="image/catalog/measurement/around_belly.jpg"></td>
		</tr>
		<tr>
			<td><strong>Upper Bust</strong><br> *Relax arms at sides<br> *Measure the highest part of the chest<br> *Pull the tape right underneath the arms</td>
			<td><strong>Bust</strong><br> *This is not your bra size!<br> *Wear a bra<br> *Relax arms at sides<br> *Pull tape across the fullest part of the bust</td>
			<td><strong>Under Bust</strong><br> Measure immediately under breasts</td>
			<td><strong>Around Belly</strong><br> *Find the fullest part of the belly<br> *Pull tape around the belly<br> *Keep tape slight loose for comfort</td>
		</tr>
		<tr>
			<td width="33%"><img width ="250px" alt="How to Measure hips" src="image/catalog/measurement/hips.jpg"></td>
			<td width="33%"><img width ="250px" alt="How to Measure hollow to floor" src="image/catalog/measurement/hollow_to_floor.jpg"></td>
			<td width="33%"><img width ="250px" alt="How to Measure height" src="image/catalog/measurement/height.jpg"></td>
		</tr>
		<tr>
			<td><strong>Hips</strong><br> *Find the widest part of the hips<br> *Usually about 7 in. below natural waist<br> *Tape should brush across both hipbones</td>
			<td><strong>Hollow to Floor (Bare Foot)</strong><br> *Stand straight with feet together <br> *Measure in bare feet<br> *Begin at the hollow space <br>between the collarbones and<br> pull tape straight down to the floor<br> *To fit high heels, we’ll add<br>an extra 5 cm onto custom-sized<br>floor-length dresses and dresses with trains</td>
			<td><strong>Height</strong><br> * Stand straight with feet together<br> * Measure in bare feet<br> * Begin at the top of the head and <br>pull tape straight down to the floor</td>

		</tr>
		<tr>
			<td colspan="4" class="hr measure_class_dash">&nbsp;</td>
		</tr>
		<tr>
			<td colspan="4">
				<h4>For Bridal Jacket/ Mini Wraps</h4>
			</td>
		</tr>
		<tr>
			<td width="25%"><img width="250px" alt="How to Measure bust" src="image/catalog/measurement/bust.jpg"></td>
			<td width="25%"><img width="250px" alt="How to Measure shoulder" src="image/catalog/measurement/shoulder.jpg"></td>
			<td width="25%"><img width="250px" alt="How to Measure arm length" src="image/catalog/measurement/arm_length.jpg"></td>
			<td width="25%"><img width="250px" alt="How to Measure armscye" src="image/catalog/measurement/armscye.jpg"></td>
		</tr>
		<tr>
			<td><strong>Bust</strong><br> Bust - Not your bra size! Take the tape around your back and bring it across the fullest part of your bust.</td>
			<td><strong> Shoulder</strong><br> Shoulder - From the edge of the shoulder socket, measure across the back to the same point on the other shoulder.</td>
			<td><strong>Arm Length</strong><br> Arm Length - Measure from your shoulder point to the wrist.</td>
			<td><strong>Armscye</strong><br> Measure from the top of the shoulder, down the front of the shoulder, under the arm pit, and up the back of the shoulder.</td>
		</tr>
		</tbody>
	</table>
</div>
  <!--yuxing<?php if ($attribute_groups) { ?>
  <div id="tab-attribute" class="tab-content">
    <table class="attribute" cellspacing="0">
      <?php foreach ($attribute_groups as $attribute_group) { ?>
      <thead>
        <tr>
          <td colspan="2"><?php echo $attribute_group['name']; ?></td>
        </tr>
      </thead>
      <tbody>
        <?php foreach ($attribute_group['attribute'] as $attribute) { ?>
        <tr>
          <td><?php echo $attribute['name']; ?></td>
          <td><?php echo $attribute['text']; ?></td>
        </tr>
        <?php } ?>
      </tbody>
      <?php } ?>
    </table>
  </div>
  <?php } ?>-->
<?php if ($review_status) { ?>
            <div class="tab-pane" id="tab-review">
              <form class="form-horizontal" id="form-review">
                <div id="review"></div>
                <h2><?php echo $text_write; ?></h2>
                <?php if ($review_guest) { ?>
                <div class="form-group required">
                  <div class="col-sm-12">
                    <label class="control-label" for="input-name"><?php echo $entry_name; ?></label>
                    <input type="text" name="name" value="" id="input-name" class="form-control" />
                  </div>
                </div>
                <div class="form-group required">
                  <div class="col-sm-12">
                    <label class="control-label" for="input-review"><?php echo $entry_review; ?></label>
                    <textarea name="text" rows="5" id="input-review" class="form-control"></textarea>
                    <div class="help-block"><?php echo $text_note; ?></div>
                  </div>
                </div>
                <div class="form-group required">
                  <div class="col-sm-12">
                    <label class="control-label"><?php echo $entry_rating; ?></label>
                    &nbsp;&nbsp;&nbsp; <?php echo $entry_bad; ?>&nbsp;
                    <input type="radio" name="rating" value="1" />
                    &nbsp;
                    <input type="radio" name="rating" value="2" />
                    &nbsp;
                    <input type="radio" name="rating" value="3" />
                    &nbsp;
                    <input type="radio" name="rating" value="4" />
                    &nbsp;
                    <input type="radio" name="rating" value="5" />
                    &nbsp;<?php echo $entry_good; ?></div>
                </div>
                <?php if ($site_key) { ?>
                  <div class="form-group">
                    <div class="col-sm-12">
                      <div class="g-recaptcha" data-sitekey="<?php echo $site_key; ?>"></div>
                    </div>
                  </div>
                <?php } ?>
                <div class="buttons clearfix">
                  <div class="pull-right">
                    <button type="button" id="button-review" data-loading-text="<?php echo $text_loading; ?>" class="button"><?php echo $button_continue; ?></button>
                  </div>
                </div>
                <?php } else { ?>
                <?php echo $text_login; ?>
                <?php } ?>
              </form>
            </div>
            <?php } ?>
  <?php if ($tags) { ?>
  <div class="tags_product"><b><?php echo $text_tags; ?></b>
    <?php for ($i = 0; $i < count($tags); $i++) { ?>
    <?php if ($i < (count($tags) - 1)) { ?>
    <a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>,
    <?php } else { ?>
    <a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>
    <?php } ?>
    <?php } ?>
  </div>
  <?php } ?>
  <?php if ($products) { ?>
  <?php
  $class = 3;
  $id = rand(0, 5000)*rand(0, 5000);
  $all = 4;
  $row = 4;

  if($theme_options->get( 'product_per_pow2' ) == 6) { $class = 2; }
  if($theme_options->get( 'product_per_pow2' ) == 5) { $class = 25; }
  if($theme_options->get( 'product_per_pow2' ) == 3) { $class = 4; }

  if($theme_options->get( 'product_per_pow2' ) > 1) { $row = $theme_options->get( 'product_per_pow2' ); $all = $theme_options->get( 'product_per_pow2' ); }
  ?>
  <div class="box">
    <?php if($theme_options->get( 'product_scroll_related' ) != '0') { ?>
    <!-- Carousel nav -->
			<?php if ($i > $theme_options->get( 'product_per_pow2' )) { ?>
				<a class="next-button" href="#myCarousel<?php echo $id; ?>" id="myCarousel<?php echo $id; ?>_next"><span></span></a>
				<a class="prev-button" href="#myCarousel<?php echo $id; ?>" id="myCarousel<?php echo $id; ?>_prev"><span></span></a>
			<?php } ?>
    <?php } ?>

    <div class="box-heading2"><?php echo $text_related; ?></div>
    <div class="box-content products related-products hidden-xs">
      <div class="box-product">
      	<div id="myCarousel<?php echo $id; ?>" <?php if($theme_options->get( 'product_scroll_related' ) != '0') { ?>class="carousel slide"<?php } ?>>
      		<!-- Carousel items -->
      		<div class="carousel-inner">
      			<?php $i = 0; $row_fluid = 0; $item = 0; foreach ($products as $product) { $row_fluid++; ?>
  	    			<?php if($i == 0) { $item++; echo '<div class="active item"><div class="product-grid"><div class="row">'; } ?>
  	    			<?php $r=$row_fluid-floor($row_fluid/$all)*$all; if($row_fluid>$all && $r == 1) { if($theme_options->get( 'product_scroll_related' ) != '0') { echo '</div></div></div><div class="item"><div class="product-grid"><div class="row">'; $item++; } else { echo '</div><div class="row">'; } } else { $r=$row_fluid-floor($row_fluid/$row)*$row; if($row_fluid>$row && $r == 1) { echo '</div><div class="row">'; } } ?>
  	    			<div class="col-sm-<?php echo $class; ?>">
  	    				<?php include('catalog/view/theme/'.$config->get('config_template').'/template/themeglobal/product.tpl'); ?>
  	    			</div>
      			<?php $i++; } ?>
      			<?php if($i > 0) { echo '</div></div></div>'; } ?>
      		</div>
  		</div>
      </div>
    </div>
	<?php $all = 4;$row = 4;  ?>
	<!-- For Mobiles view -->
	<div class="box-content products related-products visible-xs">
      <div class="box-product">
      	<div id="myCarousel<?php echo $id; ?>" <?php if($theme_options->get( 'product_scroll_related' ) != '0') { ?>class="carousel slide"<?php } ?>>
      		<!-- Carousel items -->
      		<div class="carousel-inner">
      			<?php $i = 0; $row_fluid = 0; $item = 0; foreach ($products as $product) { $row_fluid++; ?>
  	    			<?php if($i == 0) { $item++; echo '<div class="active item"><div class="product-grid"><div class="row">'; } ?>
  	    			<?php $r=$row_fluid-floor($row_fluid/$all)*$all; if($row_fluid>$all && $r == 1) { if($theme_options->get( 'product_scroll_related' ) != '0') { echo '</div></div></div><div class="item"><div class="product-grid"><div class="row">'; $item++; } else { echo '</div><div class="row">'; } } else { $r=$row_fluid-floor($row_fluid/$row)*$row; if($row_fluid>$row && $r == 1) { echo '</div><div class="row">'; } } ?>
  	    			<div class="col-xs-6">
  	    				<?php include('catalog/view/theme/'.$config->get('config_template').'/template/themeglobal/product.tpl'); ?>
  	    			</div>
      			<?php $i++; } ?>
      			<?php if($i > 0) { echo '</div></div></div>'; } ?>
      		</div>
  		</div>
      </div>
    </div>
  </div>
  <?php } ?>
</div>

<?php if($theme_options->get( 'product_scroll_related' ) != '0') { ?>
<script type="text/javascript">
$(document).ready(function() {
  var owl<?php echo $id; ?> = $(".box #myCarousel<?php echo $id; ?> .carousel-inner");

  $("#myCarousel<?php echo $id; ?>_next").click(function(){
      owl<?php echo $id; ?>.trigger('owl.next');
      return false;
    })
  $("#myCarousel<?php echo $id; ?>_prev").click(function(){
      owl<?php echo $id; ?>.trigger('owl.prev');
      return false;
  });

  owl<?php echo $id; ?>.owlCarousel({
  	  slideSpeed : 500,
      singleItem:true
   });
});
</script>
<?php } ?>
<script type="text/javascript"><!--
$('select[name=\'recurring_id\'], input[name="quantity"]').change(function(){
	$.ajax({
		url: 'index.php?route=product/product/getRecurringDescription',
		type: 'post',
		data: $('input[name=\'product_id\'], input[name=\'quantity\'], select[name=\'recurring_id\']'),
		dataType: 'json',
		beforeSend: function() {
			$('#recurring-description').html('');
		},
		success: function(json) {
			$('.alert, .text-danger').remove();

			if (json['success']) {
				$('#recurring-description').html(json['success']);
			}
		}
	});
});
//--></script>
<script type="text/javascript"><!--
$('#button-cart').on('click', function() {
	$.ajax({
		url: 'index.php?route=checkout/cart/add',
		type: 'post',
		data: $('#product input[type=\'text\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea'),
		dataType: 'json',
		success: function(json) {
			$('.alert, .text-danger').remove();
			$('.form-group').removeClass('has-error');

			if (json['error']) {
				if (json['error']['option']) {
					for (i in json['error']['option']) {
						var element = $('#input-option' + i.replace('_', '-'));

						if (element.parent().hasClass('input-group')) {
							element.parent().after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
						} else {
							element.after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
						}
					}
				}

				if (json['error']['recurring']) {
					$('select[name=\'recurring_id\']').after('<div class="text-danger">' + json['error']['recurring'] + '</div>');
				}

				// Highlight any found errors
				$('.text-danger').parent().addClass('has-error');
			}

			if (json['success']) {
				$("#notification .modal-footer").show();
				$("#notification").modal('show');
				$("#notification .modal-body p").html(json['success']);

				$('#cart #cart_content').load('index.php?route=common/cart/info #cart_content_ajax');
				$('#cart-total').html(json['total']);
			}
		}
	});
});//--></script>
<script type="text/javascript"><!--
$('.date').datetimepicker({
	pickTime: false
});

$('.datetime').datetimepicker({
	pickDate: true,
	pickTime: true
});

$('.time').datetimepicker({
	pickDate: false
});

$('button[id^=\'button-upload\']').on('click', function() {
	var node = this;

	$('#form-upload').remove();

	$('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');

	$('#form-upload input[name=\'file\']').trigger('click');

	$('#form-upload input[name=\'file\']').on('change', function() {
		$.ajax({
			url: 'index.php?route=tool/upload',
			type: 'post',
			dataType: 'json',
			data: new FormData($(this).parent()[0]),
			cache: false,
			contentType: false,
			processData: false,
			beforeSend: function() {
				$(node).button('loading');
			},
			complete: function() {
				$(node).button('reset');
			},
			success: function(json) {
				$('.text-danger').remove();

				if (json['error']) {
					$(node).parent().find('input').after('<div class="text-danger">' + json['error'] + '</div>');
				}

				if (json['success']) {
					alert(json['success']);

					$(node).parent().find('input').attr('value', json['code']);
				}
			},
			error: function(xhr, ajaxOptions, thrownError) {
				alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			}
		});
	});
});
//--></script>
<script type="text/javascript"><!--
$('#review').delegate('.pagination a', 'click', function(e) {
	e.preventDefault();

    $('#review').fadeOut('slow');

    $('#review').load(this.href);

    $('#review').fadeIn('slow');
});

$('#review').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?>');

$('#button-review').on('click', function() {
	$.ajax({
		url: 'index.php?route=product/product/write&product_id=<?php echo $product_id; ?>',
		type: 'post',
		dataType: 'json',
		data: $("#form-review").serialize(),
		beforeSend: function() {
			$('#button-review').button('loading');
		},
		complete: function() {
			$('#button-review').button('reset');
		},
		success: function(json) {
			$('.alert-success, .alert-danger').remove();

			if (json['error']) {
				$('#review').after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
			}

			if (json['success']) {
				$('#review').after('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');

				$('input[name=\'name\']').val('');
				$('textarea[name=\'text\']').val('');
				$('input[name=\'rating\']:checked').prop('checked', false);
			}
		}
	});
});
</script>

<script type="text/javascript"><!--
$(document).ready(function() {
	$('.popup-gallery').magnificPopup({
		delegate: 'a',
		type: 'image',
		tLoading: 'Loading image #%curr%...',
		mainClass: 'mfp-img-mobile',
		gallery: {
			enabled: true,
			navigateByImgClick: true,
			preload: [0,1] // Will preload 0 - before current, and 1 after the current image
		},
		image: {
			tError: '<a href="%url%">The image #%curr%</a> could not be loaded.',
			titleSrc: function(item) {
				return item.el.attr('title');
			}
		}
	});
});
//--></script>

<script type="text/javascript">
$.fn.tabs = function() {
	var selector = this;

	this.each(function() {
		var obj = $(this);

		$(obj.attr('href')).hide();

		$(obj).click(function() {
			$(selector).removeClass('selected');

			$(selector).each(function(i, element) {
				$($(element).attr('href')).hide();
			});

			$(this).addClass('selected');

			$($(this).attr('href')).show();

			return false;
		});
	});

	$(this).show();

	$(this).first().click();
};
</script>

<script type="text/javascript"><!--
$('#tabs a').tabs();
//--></script>

<?php if($theme_options->get( 'product_image_zoom' ) != 2) {
echo '<script type="text/javascript" src="catalog/view/theme/' . $config->get( 'config_template' ) . '/js/jquery.elevateZoom-3.0.3.min.js"></script>';
} ?>

<?php include('catalog/view/theme/'.$config->get('config_template').'/template/themeglobal/themeglobal_bottom.tpl'); ?>
<?php echo $footer; ?>
