<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
 <section class="navigation">
	    <div class="container">
	       
	        <nav class="navbar navbar-default yamm">
	            <div class="navbar-header">
	                <button type="button" class="navbar-toggle"> 
	                	<span class="sr-only"><?php esc_html_e( 'Toggle navigation', 'glowmag' ); ?></span> 
	                	<span class="icon-bar"></span> 
	                	<span class="icon-bar"></span> 
	                	<span class="icon-bar"></span> 
	                </button>
	            </div>
	            <div id="navbar" class="navbar-collapse">
                        <span class="nav-close">X</span>
	                <?php

	                	if (has_nav_menu('primary'))
	                	   {
			                    wp_nav_menu(array(
		                            'theme_location' => 'primary',
		                            'depth'          => 4,
		                            'menu_class'     => 'nav navbar-nav',
		                            'fallback_cb'    => 'wp_bootstrap_navwalker::fallback',
		                            'walker'         => new WP_Bootstrap_Navwalker()
			                        )
			                    );
			                }

                         if( $show_search == 1 )
			                
			                {
			                ?> 	
				                <ul class="nav navbar-nav navbar-right">
				                    <li>
				                        <form class="nav-search" action="<?php echo home_url( '/' ); ?>" method="get" id="searchform">
				                            <input type="text" name="s" id="s" class="form-control" placeholder=" <?php esc_html_e( 'Search For News', 'glowmag' ); ?>">
				                            <button type="submit" id="searchsubmit"  class="btn-submit"><i class="fa fa-search"></i></button>
				                        </form>
				                       
				                    </li>
				                </ul>
				                
				       <?php } ?>        
	            </div>
	        
	        </nav>
	    </div>
	</section>
</body>
</html>