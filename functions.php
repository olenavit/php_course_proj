<?php
$upload_directory = "uploads";

function last_id()
{
    global $connection;

    return mysqli_insert_id($connection);
}


function set_message($msg)
{
    if (!empty($msg)) {

        $_SESSION['message'] = $msg;

    } else {
        $msg = "";
    }
}


function display_message()
{
    if (isset($_SESSION['message'])) {

        echo $_SESSION['message'];
        unset($_SESSION['message']);

    }
}


function redirect($location)
{
    return header("Location: $location ");
}


function query($sql)
{
    global $connection;

    return mysqli_query($connection, $sql);
}


function confirm($result)
{
    global $connection;

    if (!$result) {

        die("QUERY FAILED " . mysqli_error($connection));


    }
}


function escape_string($string)
{
    global $connection;

    return mysqli_real_escape_string($connection, $string);
}


function fetch_array($result)
{
    return mysqli_fetch_array($result);
}


/****************************FRONT END FUNCTIONS************************/


function count_all_records($table)
{
    return mysqli_num_rows(query('SELECT * FROM ' . $table));
}

function count_all_products_in_stock()
{
    return mysqli_num_rows(query('SELECT * FROM products WHERE product_quantity >= 1'));
}

function get_products_with_pagination($perPage = "6")
{
    $rows = count_all_products_in_stock();

    if (!empty($rows)) {

        if (isset($_GET['page'])) { //get page from URL if its there
            $page = preg_replace('#[^0-9]#', '', $_GET['page']);//filter everything but numbers


        } else {
            $page = 1;
        }

        $lastPage = ceil($rows / $perPage);

        if ($page < 1) {
            $page = 1;
        } elseif ($page > $lastPage) {
            $page = $lastPage;
        }

        $middleNumbers = '';
        $sub1 = $page - 1;
        $sub2 = $page - 2;
        $add1 = $page + 1;
        $add2 = $page + 2;
        if ($page == 1) {
            $middleNumbers .= '<li class="page-item active"><a>' . $page . '</a></li>';
            $middleNumbers .= '<li class="page-item"><a class="page-link" href="' . $_SERVER['PHP_SELF'] . '?page=' . $add1 . '">' . $add1 . '</a></li>';
        } elseif ($page == $lastPage) {
            $middleNumbers .= '<li class="page-item"><a class="page-link" href="' . $_SERVER['PHP_SELF'] . '?page=' . $sub1 . '">' . $sub1 . '</a></li>';
            $middleNumbers .= '<li class="page-item active"><a>' . $page . '</a></li>';
        } elseif ($page > 2 && $page < ($lastPage - 1)) {
            $middleNumbers .= '<li class="page-item"><a class="page-link" href="' . $_SERVER['PHP_SELF'] . '?page=' . $sub2 . '">' . $sub2 . '</a></li>';
            $middleNumbers .= '<li class="page-item"><a class="page-link" href="' . $_SERVER['PHP_SELF'] . '?page=' . $sub1 . '">' . $sub1 . '</a></li>';
            $middleNumbers .= '<li class="page-item active"><a>' . $page . '</a></li>';
            $middleNumbers .= '<li class="page-item"><a class="page-link" href="' . $_SERVER['PHP_SELF'] . '?page=' . $add1 . '">' . $add1 . '</a></li>';
            $middleNumbers .= '<li class="page-item"><a class="page-link" href="' . $_SERVER['PHP_SELF'] . '?page=' . $add2 . '">' . $add2 . '</a></li>';
        } elseif ($page > 1 && $page < $lastPage) {
            $middleNumbers .= '<li class="page-item"><a class="page-link" href="' . $_SERVER['PHP_SELF'] . '?page= ' . $sub1 . '">' . $sub1 . '</a></li>';
            $middleNumbers .= '<li class="page-item active"><a>' . $page . '</a></li>';
            $middleNumbers .= '<li class="page-item"><a class="page-link" href="' . $_SERVER['PHP_SELF'] . '?page=' . $add1 . '">' . $add1 . '</a></li>';
        }

        $limit = 'LIMIT ' . ($page - 1) * $perPage . ',' . $perPage;
        $query2 = query(" SELECT * FROM products WHERE product_quantity >= 1 " . $limit);
        confirm($query2);
        $outputPagination = ""; // Initialize the pagination output variable

        if ($page != 1) {
            $prev = $page - 1;
            $outputPagination .= '<li class="page-item"><a class="page-link" href="' . $_SERVER['PHP_SELF'] . '?page=' . $prev . '">Back</a></li>';
        }

        $outputPagination .= $middleNumbers;

        if ($page != $lastPage) {
            $next = $page + 1;
            $outputPagination .= '<li class="page-item"><a class="page-link" href="' . $_SERVER['PHP_SELF'] . '?page=' . $next . '">Next</a></li>';
        }

        while ($row = fetch_array($query2)) {
            $product_image = display_image($row['product_image']);
            $product = <<<DELIMETER

<div class="col-sm-4 col-lg-4 col-md-4">
    <div class="thumbnail">
        <a href="item.php?id={$row['product_id']}"><img class="img-responsive" style="max-height: 250px; min-height: 250px"  src="../resources/{$product_image}" alt=""></a>
        <div class="caption">
            <h4><a href="item.php?id={$row['product_id']}">{$row['product_title']}</a> </h4>
             <p class="text-center"><a class="btn btn-primary" target="_blank" href="../resources/cart.php?add={$row['product_id']}">Add to cart</a>
             </a> <a href="item.php?id={$row['product_id']}" class="btn btn-default">More Info</a></p>
             
            <h4 class="pull-right">&#36;{$row['product_price']}</h4>
        </div>
    </div>
</div>

DELIMETER;
            echo $product;
        }

        echo "<div class='text-center' style='clear: both;' ><ul class='pagination' >{$outputPagination}</ul></div>";

    } else {


        echo "<h1 class='text-center'>No Products</h1>";
        echo "<br>";
        echo "<p class='text-center'>Create some products <a href='http://localhost:8888/ecom-paypal/public/admin/index.php?add_product'>HERE</a></p>";

    }
}

function get_categories()
{
    $query = query("SELECT * FROM categories");
    confirm($query);

    while ($row = fetch_array($query)) {
        $categories_links = <<<DELIMETER

<a href='category.php?id={$row['cat_id']}' style="color: #fff; background-color: #337ab7; " class='list-group-item'>{$row['cat_title']}</a>


DELIMETER;
        echo $categories_links;
    }
}


function get_products_in_cat_page()
{
    $query = query(" SELECT * FROM products WHERE product_category_id = " . escape_string($_GET['id']) . " AND product_quantity >= 1 ");
    confirm($query);

    while ($row = fetch_array($query)) {

        $product_image = display_image($row['product_image']);

        $product = <<<DELIMETER


            <div class="col-md-3 col-sm-6 hero-feature">
                <div class="thumbnail">
                    <img src="../resources/{$product_image}" alt="">
                    <div class="caption">
                        <h3>{$row['product_title']}</h3>
                        <p>
                            <a href="../resources/cart.php?add={$row['product_id']}" class="btn btn-primary">Buy Now!</a> <a href="item.php?id={$row['product_id']}" class="btn btn-default">More Info</a>
                        </p>
                    </div>
                </div>
            </div>

DELIMETER;

        echo $product;
    }
}

function login_user()
{
    if (isset($_POST['submit'])) {

        $username = escape_string($_POST['username']);
        $password = escape_string($_POST['password']);

        $query = query("SELECT * FROM users WHERE username = '{$username}' AND password = '{$password }' ");
        confirm($query);

        if (mysqli_num_rows($query) == 0) {

            set_message("Your Password or Username are wrong");
            redirect("login.php");

        } else {

            $_SESSION['username'] = $username;
            redirect("admin");

        }
    }
}
