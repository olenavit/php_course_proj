<?php require_once("../resources/config.php"); ?>

<?php include(TEMPLATE_FRONT . DS . "header.php") ?>

<div class="container">

    <header>
        <h1>Shop</h1>
    </header>
    <hr>
    <div class="row text-center">

        <?php get_products_with_pagination(); ?>

    </div>
</div>

<?php include(TEMPLATE_FRONT . DS . "footer.php") ?>
