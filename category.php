<?php require_once("../resources/config.php"); ?>

<?php include(TEMPLATE_FRONT . DS . "header.php") ?>

    <!-- Page Content -->
    <div class="container">

        <!-- Jumbotron Header -->
        <header class="jumbotron hero-spacer">
            <h1>A Warm Welcome!</h1>
            <p>Welcome to our online store of household appliances! We are thrilled to have you here and hope that you find everything you need to make your house a home. Whether you are in search of a new refrigerator, washing machine, gas cooker, or coffee machine, we have a wide selection of high-quality products to suit your needs. Our team of experts is dedicated to providing exceptional customer service and ensuring your online shopping experience is seamless and enjoyable. Thank you for choosing us as your go-to destination for household appliances.</p>
            <p><a href="shop.php" class="btn btn-primary btn-large">Call to action!</a>
            </p>
        </header>

        <hr>

        <!-- Title -->
        <div class="row">
            <div class="col-lg-12">
                <h3>Latest Product</h3>
            </div>
        </div>
        <!-- /.row -->

        <!-- Page Features -->
        <div class="row text-center">

         <?php get_products_in_cat_page(); ?>


        </div>
        <!-- /.row -->

      

    </div>
    <!-- /.container -->


<?php include(TEMPLATE_FRONT . DS . "footer.php") ?>
