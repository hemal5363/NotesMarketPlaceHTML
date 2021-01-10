$(function () {
    
    $("#menu-icon").click(function(){
        $("#mobile-menu-page").show();
    });    
    
    $("#mobile-close").click(function(){
        $("#mobile-menu-page").hide();
    });
    
    $(".sub-menu").click(function () {
        var target = $(this).attr("target");
        $(target).toggle();
    });
});

/* =====================================================
                    Password Show
===================================================== */

$(function () {

    $(".show-pass").on("click", function () {

        //        $(this).find('[data-fa-i2svg]').toggleClass('fa-eye fa-eye-slash');
        var currentState = $(this).attr("target");

        if ($(currentState).attr('type') == "password") {
            $(currentState).attr('type', "text");
        } else {
            $(currentState).attr('type', "password");
        }
    });
});

/* =====================================================
                        Header
===================================================== */

function sticky_header() {
    var header_height = jQuery('.site-header').innerHeight() / 2;
    var scrollTop = jQuery(window).scrollTop();
    var a = $("section").attr("id");
    if (a == "home") {
        if (scrollTop > header_height) {
            jQuery('body').addClass('sticky-header');
            jQuery('.logo-wrapper img').attr('src', "images/images/logo.png");
        } else {
            jQuery('body').removeClass('sticky-header');
            jQuery('.logo-wrapper img').attr('src', "images/images/top-logo.png");
        }
    }
}

jQuery(document).ready(function () {
    sticky_header();
});

jQuery(window).scroll(function () {
    sticky_header();
});
jQuery(window).resize(function () {
    sticky_header();
});

/* =====================================================
                        User Menu
===================================================== */

{
    var target = "";

    $(function () {

        $(".user-menu").click(function () {

            var target1 = $(this).attr("target");
            $(target1).toggle();
            if (target1 != target) {
                $(target).hide();
            }
            target = target1;

        });
    });
}

/* =====================================================
                    Thank You Popup
===================================================== */

$(function () {

    $("#download-book").click(function () {
        $("#thank-you-popup").show();
    });

    $("#close-btn").click(function () {
        $("#thank-you-popup").hide();
    });

});

/* =====================================================
                    Download Popup
===================================================== */
{
    var target = "";

    $(function () {

        $(".menu-check").click(function () {

            var target1 = $(this).attr("target");
            $(target1).toggle();
            if (target1 != target) {
                $(target).hide();
            }
            target = target1;

        });
    });

    /* =====================================================
                            Add Review
    ===================================================== */

    $(function () {

        $("#close-btn").click(function () {
            $("#add-review-bg").toggle();
        });

        $(".add-r-f").click(function () {
            $("#add-review-bg").toggle();
            $(target).hide();
        });

    });
}

/* =====================================================
                            FAQ
===================================================== */

$(function () {
    $('.FAQ-pm img').click(function () {
        var a = $(this).attr("data-target");

        if ($(this).attr("src") == "images/images/minus.png") {
            $(this).attr("src", "images/images/plus.png");
            $(a).attr("class", "FAQ-box-add");
        } else {
            $(this).attr("src", "images/images/minus.png");
            $(a).removeAttr("class");
        }
    })
});

/* =====================================================
                    Remarks Popup
===================================================== */

$(function () {

    $(".reject-btn").click(function () {
        var target1 = $(this).attr("target");
        $(target1).show();
    });

    $(".unpublish").click(function () {
        var target1 = $(this).attr("target");
        $(target1).show();
    });


    $("#close-btn").click(function () {
        $("#add-review-bg").hide();
    });
});

/* =====================================================
                    Search Bar
===================================================== */

$(function () {
    $("#search-input").keydown(function () {
        $('.search-icon img').attr('src', "");
        $(this).attr('placeholder', "");
    });

    $("#search-input1").keydown(function () {
        $('.search-icon img').attr('src', "");
        $(this).attr('placeholder', "");
    });
});


function myFunction() {
    var input, filter, table, tr, td, i, txtValue;
    input = document.getElementById("search-input");
    filter = input.value.toUpperCase();
    table = document.getElementById("pager");
    tr = table.getElementsByTagName("tr");
    for (i = 0; i < tr.length; i++) {
        td = tr[i].getElementsByTagName("td")[0];
        if (td) {
            txtValue = td.textContent || td.innerText;
            if (txtValue.toUpperCase().indexOf(filter) > -1) {
                tr[i].style.display = "";
            } else {
                tr[i].style.display = "none";
            }
        }
    }
}

function myFunction1() {
    var input, filter, table, tr, td, i, txtValue;
    input = document.getElementById("search-input1");
    filter = input.value.toUpperCase();
    table = document.getElementById("pager1");
    tr = table.getElementsByTagName("tr");
    for (i = 0; i < tr.length; i++) {
        td = tr[i].getElementsByTagName("td")[0];
        if (td) {
            txtValue = td.textContent || td.innerText;
            if (txtValue.toUpperCase().indexOf(filter) > -1) {
                tr[i].style.display = "";
            } else {
                tr[i].style.display = "none";
            }
        }
    }
}

/* =====================================================
                    Table Sorter
===================================================== */

$(function () {
    $(".sort-table").tablesorter();
});

/* =====================================================
                    Page Nav
===================================================== */

/* eslint-env browser */
/* global document */

function Pager(tableName, itemsPerPage) {
    'use strict';

    this.tableName = tableName;
    this.itemsPerPage = itemsPerPage;
    this.currentPage = 1;
    this.pages = 0;
    this.inited = false;

    this.showRecords = function (from, to) {
        let rows = document.getElementById(tableName).rows;

        // i starts from 1 to skip table header row
        for (let i = 1; i < rows.length; i++) {
            if (i < from || i > to) {
                rows[i].style.display = 'none';
            } else {
                rows[i].style.display = '';
            }
        }
    };

    this.showPage = function (pageNumber) {
        if (!this.inited) {
            // Not initialized
            return;
        }

        let oldPageAnchor = document.getElementById('pg' + this.currentPage);
        oldPageAnchor.className = 'pg-normal';

        this.currentPage = pageNumber;
        let newPageAnchor = document.getElementById('pg' + this.currentPage);
        newPageAnchor.className = 'pg-selected';

        let from = (pageNumber - 1) * itemsPerPage + 1;
        let to = from + itemsPerPage - 1;
        this.showRecords(from, to);

        let pgNext = document.querySelector('.pg-next'),
            pgPrev = document.querySelector('.pg-prev');
    };

    this.prev = function () {
        if (this.currentPage > 1) {
            this.showPage(this.currentPage - 1);
        }
    };

    this.next = function () {
        if (this.currentPage < this.pages) {
            this.showPage(this.currentPage + 1);
        }
    };

    this.init = function () {
        let rows = document.getElementById(tableName).rows;
        let records = (rows.length - 1);

        this.pages = Math.ceil(records / itemsPerPage);
        this.inited = true;
    };

    this.showPageNav = function (pagerName, positionId) {
        if (!this.inited) {
            // Not initialized
            return;
        }

        let element = document.getElementById(positionId),
            pagerHtml = '<span onclick="' + pagerName + '.prev();" class="pg-normal"><img src="images/images/left-arrow.png"></span>';

        for (let page = 1; page <= this.pages; page++) {
            pagerHtml += '<span id="pg' + page + '" class="pg-normal pg-next" onclick="' + pagerName + '.showPage(' + page + ');">' + page + '</span>';
        }

        pagerHtml += '<span onclick="' + pagerName + '.next();" class="pg-normal"><img src="images/images/right-arrow.png"></span>';

        element.innerHTML = pagerHtml;
    };
}

//
var a;
if ($("section").attr('id') == "my-downloads" || $("section").attr('id') == "buyer-requests" || $("section").attr('id') == "my-rejected-notes" || $("section").attr('id') == "my-sold-notes") {
    a = 10;
} else if ($("section").attr('id') == "search-notes") {
    a = 3;
} else {
    a = 5;
}

let pager = new Pager('pager', a);
pager.init();
pager.showPageNav('pager', 'pageNavPosition');
pager.showPage(1);

let pager1 = new Pager('pager1', a);
pager1.init();
pager1.showPageNav('pager1', 'pageNavPosition1');
pager1.showPage(1);
