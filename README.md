README
======

Description
-----------

A simple set of useful functions for working in PHP with Zend.

Install
-------

Install to Pathogen with:

    git clone https://github.com/brandur/zendtools.vim.git ~/.vim/bundle/zendtools

Otherwise, try:

    git clone https://github.com/brandur/zendtools.vim.git
    cd zendtools.vim
    cp -R * ~/.vim

Usage
-----

### PrependClassRequireOnce()

Inserts a `require_once` directive for the class under the cursor that is named according to Zend conventions. Zend naming involves prepending a pseudo-namespace to the name of each class which also reveals the path to its source file (e.g. `Company_Tools_InflectionHelper` should map to `Company/Tools/InflectionHelper.php`).

Move the cursor to a class and run `<leader>zo` (**z**end + require_**o**nce) or `ZendTools#PrependClassRequireOnce()`. For example, running it for the class symbol on the following line:

    $helper = new Company_Tools_InflectionHelper();

Would result in:

    require_once 'Company/Tools/InflectionHelper.php';
    $helper = new Company_Tools_InflectionHelper();
