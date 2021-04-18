/* =====================================================
         Admin Index Published Note Functions
===================================================== */

$(() => {
    getIndexPublishedNote();

    $('.search-filter').on('change', () => {
        getIndexPublishedNote();
    });
});

function getIndexPublishedNote(target) {

    $.ajax({
        url: '/Admin/IndexPublishedNotesPartial',
        dataType: 'html',
        method: 'GET',
        data: {
            search: $('#search-input').val(),
            month: $('#Months').val(),
            pageNumber: parseInt(target),
        },
        success: function (res) {
            $('#getIndexPublished').html('').html(res);
        }
    });
}

/* =====================================================
         Admin Published Note Functions
===================================================== */

$(() => {
    getPublishedNote();

    $('.search-filter').on('change', () => {
        getPublishedNote();
    });
});

function getPublishedNote(target) {

    $.ajax({
        url: '/Admin/PublishedNotesPartial',
        dataType: 'html',
        method: 'GET',
        data: {
            search: $('#search-input').val(),
            seller: $('#Seller').val(),
            pageNumber: parseInt(target),
        },
        success: function (res) {
            $('#getPublished').html('').html(res);
        }
    });
}

/* =====================================================
         Admin Note Under Review Functions
===================================================== */

$(() => {
    getNoteUnderReview();

    $('.search-filter').on('change', () => {
        getNoteUnderReview();
    });
});

function getNoteUnderReview(target) {

    $.ajax({
        url: '/Admin/NoteUnderReviewPartial',
        dataType: 'html',
        method: 'GET',
        data: {
            search: $('#search-input').val(),
            seller: $('#Seller').val(),
            pageNumber: parseInt(target),
        },
        success: function (res) {
            $('#getNoteUnderReview').html('').html(res);
        }
    });
}

/* =====================================================
         Admin Downloaded Note Functions
===================================================== */

$(() => {
    getDownloadedNote();

    $('.search-filter').on('change', () => {
        getDownloadedNote();
    });
});

function getDownloadedNote(target) {

    $.ajax({
        url: '/Admin/DownloadedNotesPartial',
        dataType: 'html',
        method: 'GET',
        data: {
            search: $('#search-input').val(),
            note: $('#Note').val(),
            seller: $('#Seller').val(),
            buyer: $('#Buyer').val(),
            pageNumber: parseInt(target),
        },
        success: function (res) {
            $('#getDownloaded').html('').html(res);
        }
    });
}

/* =====================================================
         Admin Reject Note Functions
===================================================== */

$(() => {
    getRejectNote();

    $('.search-filter').on('change', () => {
        getRejectNote();
    });
});

function getRejectNote(target) {

    $.ajax({
        url: '/Admin/RejectedNotesPartial',
        dataType: 'html',
        method: 'GET',
        data: {
            search: $('#search-input').val(),
            seller: $('#Seller').val(),
            pageNumber: parseInt(target),
        },
        success: function (res) {
            $('#getReject').html('').html(res);
        }
    });
}

/* =====================================================
                Admin Members Functions
===================================================== */

$(() => {
    getMembers();

    $('.search-filter').on('change', () => {
        getMembers();
    });
});

function getMembers(target) {

    $.ajax({
        url: '/Admin/MembersPartial',
        dataType: 'html',
        method: 'GET',
        data: {
            search: $('#search-input').val(),
            pageNumber: parseInt(target),
        },
        success: function (res) {
            $('#getMember').html('').html(res);
        }
    });
}

/* =====================================================
                Admin Members Notes Functions
===================================================== */
$(() => {
    getMembersNotes();
});

function getMembersNotes(target) {

    $.ajax({
        url: '/Admin/MemberDetailsPartial',
        dataType: 'html',
        method: 'GET',
        data: {
            id: $('#ID').val(),
            pageNumber: parseInt(target),
        },
        success: function (res) {
            $('#getMemberNotes').html('').html(res);
        }
    });
}

/* =====================================================
                Admin Spam Reports Functions
===================================================== */

$(() => {
    getSpamReports();

    $('.search-filter').on('change', () => {
        getSpamReports();
    });
});

function getSpamReports(target) {

    $.ajax({
        url: '/Admin/SpamReportsPartial',
        dataType: 'html',
        method: 'GET',
        data: {
            search: $('#search-input').val(),
            pageNumber: parseInt(target),
        },
        success: function (res) {
            $('#getSpam').html('').html(res);
        }
    });
}

/* =====================================================
          Admin Manage Administrator Functions
===================================================== */

$(() => {
    getManageAdministrator();

    $('.search-filter').on('change', () => {
        getManageAdministrator();
    });
});

function getManageAdministrator(target) {

    $.ajax({
        url: '/Admin/ManageAdministratorPartial',
        dataType: 'html',
        method: 'GET',
        data: {
            search: $('#search-input').val(),
            pageNumber: parseInt(target),
        },
        success: function (res) {
            $('#getAdministrator').html('').html(res);
        }
    });
}

/* =====================================================
          Admin Manage Category Functions
===================================================== */

$(() => {
    getManageCategory();

    $('.search-filter').on('change', () => {
        getManageCategory();
    });
});

function getManageCategory(target) {

    $.ajax({
        url: '/Admin/ManageCategoryPartial',
        dataType: 'html',
        method: 'GET',
        data: {
            search: $('#search-input').val(),
            pageNumber: parseInt(target),
        },
        success: function (res) {
            $('#getCategory').html('').html(res);
        }
    });
}

/* =====================================================
          Admin Manage Type Functions
===================================================== */

$(() => {
    getManageType();

    $('.search-filter').on('change', () => {
        getManageType();
    });
});

function getManageType(target) {

    $.ajax({
        url: '/Admin/ManageTypePartial',
        dataType: 'html',
        method: 'GET',
        data: {
            search: $('#search-input').val(),
            pageNumber: parseInt(target),
        },
        success: function (res) {
            $('#getType').html('').html(res);
        }
    });
}

/* =====================================================
          Admin Manage Country Functions
===================================================== */

$(() => {
    getManageCountry();

    $('.search-filter').on('change', () => {
        getManageCountry();
    });
});

function getManageCountry(target) {

    $.ajax({
        url: '/Admin/ManageCountryPartial',
        dataType: 'html',
        method: 'GET',
        data: {
            search: $('#search-input').val(),
            pageNumber: parseInt(target),
        },
        success: function (res) {
            $('#getCountry').html('').html(res);
        }
    });
}

/* =====================================================
          Admin Manage Testimonial Functions
===================================================== */

$(() => {
    getManageTestimonial();
});

function getManageTestimonial(target) {

    $.ajax({
        url: '/Admin/ManageTestimonialPartial',
        dataType: 'html',
        method: 'GET',
        data: {
            search: $('#search-input').val(),
            pageNumber: parseInt(target),
        },
        success: function (res) {
            $('#getTestimonial').html('').html(res);
        }
    });
}

/* =====================================================
                  Search Note Functions
===================================================== */

$(() => {
    getNotes();

    $('#search-input-note').on('keyup', () => {
        getNotes();
    });
    $('.search-filter').on('change', () => {
        getNotes();
    });
});

function getNotes(target) {

    $.ajax({
        url: '/Home/FilterNote',
        dataType: 'html',
        method: 'GET',
        data: {
            search: $('#search-input-note').val(),
            type: $('#searchFilter_type').val(),
            category: $('#searchFilter_category').val(),
            univarsity: $('#searchFilter_univarsity').val(),
            course: $('#searchFilter_course').val(),
            country: $('#searchFilter_country').val(),
            pageNumber: parseInt(target),
            ratings: $('#searchFilter_reting').val()
        },
        success: function (res) {
            $('#getNoteList').html('').html(res);
        }
    });
}

/* =====================================================
                  Buyer Request Functions
===================================================== */

$(() => {
    getRequest();
});

function getRequest(target) {

    $.ajax({
        url: '/Transaction/BuyerRequestPartial',
        dataType: 'html',
        method: 'GET',
        data: {
            search: $('#search-input').val(),
            pageNumber: parseInt(target),
        },
        success: function (res) {
            $('#getBuyerRequest').html('').html(res);
        }
    });
}

/* =====================================================
                  My Downloads Functions
===================================================== */

$(() => {
    getDownloads();
});

function getDownloads(target) {

    $.ajax({
        url: '/Transaction/MyDownloadsPartial',
        dataType: 'html',
        method: 'GET',
        data: {
            search: $('#search-input').val(),
            pageNumber: parseInt(target),
        },
        success: function (res) {
            $('#getMyDownload').html('').html(res);
        }
    });
}

/* =====================================================
                  My Sold Notes Functions
===================================================== */

$(() => {
    getSoldNotes();
});

function getSoldNotes(target) {

    $.ajax({
        url: '/Transaction/MySoldNotesPartial',
        dataType: 'html',
        method: 'GET',
        data: {
            search: $('#search-input').val(),
            pageNumber: parseInt(target),
        },
        success: function (res) {
            $('#getSold').html('').html(res);
        }
    });
}

/* =====================================================
                  My Rejected Notes Functions
===================================================== */

$(() => {
    getRejectedNotes();
});

function getRejectedNotes(target) {

    $.ajax({
        url: '/Transaction/MyRejectedNotesPartial',
        dataType: 'html',
        method: 'GET',
        data: {
            search: $('#search-input').val(),
            pageNumber: parseInt(target),
        },
        success: function (res) {
            $('#getRejected').html('').html(res);
        }
    });
}

/* =====================================================
        Sell Note Published Notes Functions
===================================================== */

$(() => {
    getSellNotePublished();
});

function getSellNotePublished(target) {

    $.ajax({
        url: '/Home/SellNotePublishedNotesPartial',
        dataType: 'html',
        method: 'GET',
        data: {
            search: $('#search-input1').val(),
            pageNumber: parseInt(target),
        },
        success: function (res) {
            $('#getSellPublishedNotes').html('').html(res);
        }
    });
}

/* =====================================================
        Sell Note In Progress Notes Functions
===================================================== */

$(() => {
    getSellNoteInProgress();
});

function getSellNoteInProgress(target) {

    $.ajax({
        url: '/Home/SellNoteInProgressNotesPartial',
        dataType: 'html',
        method: 'GET',
        data: {
            search: $('#search-input').val(),
            pageNumber: parseInt(target),
        },
        success: function (res) {
            $('#getSellInProgressNotes').html('').html(res);
        }
    });
}

/* =====================================================
            Index Testimonials Functions
===================================================== */

$(() => {
    getIndexTestimonials(1);
});

function getIndexTestimonials(target) {

    $.ajax({
        url: '/Home/IndexPartial',
        dataType: 'html',
        method: 'GET',
        data: {
            pageNumber: parseInt(target),
        },
        success: function (res) {
            $('#getTestimonials').html('').html(res);
        }
    });
}

/* =====================================================
                    Mobile Menu
===================================================== */

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
            jQuery('.logo-wrapper img').attr('src', "/Images/logo.png");
        } else {
            jQuery('body').removeClass('sticky-header');
            jQuery('.logo-wrapper img').attr('src', "/Images/top-logo.png");
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
                    Active Section
===================================================== */

$(function () {
    var sid = "#" + $("section").attr("id") + "1";
    $(sid).addClass("active-section");
});

$(function () {
    var sid = "#" + $("section").attr("id") + "2";
    var asid = "#" + $("section").attr("id") + "3";
    $(sid).addClass("active-menu");
    $(asid).addClass("active-menu");
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

function RequestBtn(id) {
    if (confirm('Are you sure you want to download this Paid note. Please confirm.')) {
        $.ajax({
            url: "/Home/NoteRequest/" + id,
            method: "POST",
            data: id,
            success: function () {
                $("#thank-you-popup").show();
            }
        })
    }
}

$(function () {

    $("#close-btn").click(function () {
        $("#thank-you-popup").hide();
    });

});

/* =====================================================
                    Download Popup
===================================================== */
var target = "";

function downloadPopup(target1) {
    $(target1).toggle();

    if (target1 != target) {
        $(target).hide();
    }
    target = target1;
}
    
/* =====================================================
                        Add Review
===================================================== */
function AddReview(id) {
    $(".add-review-bg").toggle();
    $("#getdata").html('').html("<input data-val='true' data-val-number='The field id must be a number.' data-val-required='The id field is required.' id='id' name='id' type='hidden' value=" + id + ">")
    $(target).hide();
}

function closeReview() {
    $(".add-review-bg").hide();
    $("#add-review-bg1").hide();
}

function AddRemark(id, noteName, noteCategory) {
    $("#add-review-bg1").toggle();
    $("#getdataid").html('').html("<input data-val='true' data-val-number='The field id must be a number.' data-val-required='The id field is required.' id='id' name='id' type='hidden' value=" + id + ">");
    $("#getdataname").html('').html("<div id='add-review-hd' class='heading-md'><h3>" + noteName + " - " + noteCategory + "</h3 ></div >");
    $(target).hide();
}

function AdminAddRemark(id, noteName, noteCategory) {
    $(".add-review-bg").toggle();
    $("#getdataid").html('').html("<input data-val='true' data-val-number='The field id must be a number.' data-val-required='The id field is required.' id='id' name='id' type='hidden' value=" + id + ">");
    $("#getdataname").html('').html("<div id='add-review-hd' class='heading-md'><h3>" + noteName + " - " + noteCategory + "</h3 ></div >");
    $(target).hide();
}

/* =====================================================
                            FAQ
===================================================== */

$(function () {
    $('.FAQ-pm img').click(function () {
        var a = $(this).attr("data-target");

        if ($(this).attr("src") == "/Images/minus.png") {
            $(this).attr("src", "/Images/plus.png");
            $(a).attr("class", "FAQ-box-add");
        } else {
            $(this).attr("src", "/Images/minus.png");
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

    $("#search-input-note").keydown(function () {
        $('.search-icon img').attr('src', "");
        $(this).attr('placeholder', "");
    });

    $("#search-input").keydown(function () {
        $('.search-icon img').attr('src', "");
        $(this).attr('placeholder', "");
    });

    $("#search-input1").keydown(function () {
        $('.search-icon img').attr('src', "");
        $(this).attr('placeholder', "");
    });
});

/* =====================================================
                Show Uploaded File Name
===================================================== */

$(document).ready(function () {
    $('input[target = "display picture"]').change(function (e) {
        var Name = e.target.files[0].name;
        $("displayPicture").text(Name + ' is the selected file.');
    });
    $('input[target = "note pdf"]').change(function (e) {
        var Name = e.target.files[0].name;
        $("notepdf").text(Name + ' is the selected file.');
    });
    $('input[target = "note preview"]').change(function (e) {
        var Name = e.target.files[0].name;
        $("notePreview").text(Name + ' is the selected file.');
    });
    $('input[target = "profile picture"]').change(function (e) {
        var Name = e.target.files[0].name;
        $("profilePicture").text(Name + ' is the selected file.');
    });
});

function ShowPrice() {
    $('input[placeholder = "Enter your price"]').removeAttr('readonly');
}

function HidePrice() {
    console.log("ok");
    $('input[placeholder = "Enter your price"]').attr('readonly', 'readonly');
}

/* =====================================================
                    Table Sorter
===================================================== */

function funTableSorter() {
    $(".sort-table").tablesorter();
}

