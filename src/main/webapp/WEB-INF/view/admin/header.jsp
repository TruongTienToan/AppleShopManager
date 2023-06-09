<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<header id="topnav">
    <!-- Topbar Start -->
    <div class="navbar-custom">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-6">
                    <div class="logo-box">
                        <a href="index.jsp" class="logo text-center">
                                    <span class="logo-lg">
                                        <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQh8nA-fA31BwPGqFMn6E1izyLiCwboXf4z-Q&usqp=CAU" alt="" height="30">
                                        <!-- <span class="logo-lg-text-light">Zircos</span> -->
                                    </span>
                            <span class="logo-sm">
                                        <!-- <span class="logo-sm-text-dark">Z</span> -->
                                        <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQh8nA-fA31BwPGqFMn6E1izyLiCwboXf4z-Q&usqp=CAU" alt="" height="22">
                                    </span>
                        </a>
                    </div>
                    <h1 style="color: whitesmoke">APPLE SHOP</h1>

                </div>
                <div class="col-md-6" style="
                            margin-bottom: auto;
                            margin-top: auto;
                        ">
                    <div class="text-right justify-content-between">
                        <c:if test="${sessionScope['acc'] == null}">
                            <a href="/login" class="text-success">Login/Logout</a>
                        </c:if>
                        <c:if test="${sessionScope.acc != null}">
                        <span class="text-info">Hello, ${sessionScope['acc'].getFullName()}</span>
                        <a href="/logout" class="text-danger">Logout</a></div>
                    </c:if>
                </div>
        </div>

        <div class="clearfix"></div>
    </div>
    </div>
    <!-- end Topbar -->

<%--    <div class="topbar-menu">--%>
<%--        <div class="container-fluid">--%>
<%--            <div id="navigation">--%>
<%--                <!-- Navigation Menu-->--%>
<%--                <ul class="navigation-menu">--%>

<%--                    <li class="has-submenu">--%>
<%--                        <a href="#"> <i class="mdi mdi-view-dashboard"></i>Dashboard</a>--%>
<%--                        <ul class="submenu">--%>
<%--                            <c:if test="${sessionScope.acc.getIdRole() == 1}">--%>
<%--                                <li><a href="/customer">List User</a></li>--%>

<%--                            </c:if>--%>
<%--                            <c:if test="${sessionScope.acc.getIdRole() == 2 or sessionScope.acc.getIdRole() == 1}">--%>
<%--                                <li><a href="/product">Product</a></li>--%>
<%--                            </c:if>--%>
<%--                        </ul>--%>
<%--                    </li>--%>

<%--                    <li class="has-submenu">--%>
<%--                        <a href="#">--%>
<%--                            <i class="mdi mdi-layers"></i>UI Kit--%>
<%--                        </a>--%>
<%--                        <ul class="submenu megamenu">--%>
<%--                            <li>--%>
<%--                                <ul>--%>
<%--                                    <li>--%>
<%--                                        <span>Components</span>--%>
<%--                                    </li>--%>
<%--                                    <li><a href="ui-buttons.html">Buttons</a></li>--%>
<%--                                    <li><a href="ui-typography.html">Typography</a></li>--%>
<%--                                    <li><a href="ui-card.html">Card</a></li>--%>
<%--                                    <li><a href="ui-portlets.html">Portlets</a></li>--%>
<%--                                    <li><a href="ui-modals.html">Modals</a></li>--%>
<%--                                    <li><a href="ui-checkbox-radio.html">Checkboxs-Radios</a></li>--%>
<%--                                    <li><a href="ui-tabs.html">Tabs</a></li>--%>
<%--                                    <li><a href="ui-progressbars.html">Progress Bars</a></li>--%>
<%--                                </ul>--%>
<%--                            </li>--%>

<%--                            <li>--%>
<%--                                <ul>--%>
<%--                                    <li>--%>
<%--                                        <span>Components</span>--%>
<%--                                    </li>--%>
<%--                                    <li><a href="ui-notifications.html">Notification</a></li>--%>
<%--                                    <li><a href="ui-alerts.html">Alerts</a></li>--%>
<%--                                    <li><a href="ui-carousel.html">Carousel</a></li>--%>
<%--                                    <li><a href="ui-video.html">Video</a></li>--%>
<%--                                    <li><a href="ui-tooltips-popovers.html">Tooltips &amp; Popovers</a></li>--%>
<%--                                    <li><a href="ui-images.html">Images</a></li>--%>
<%--                                    <li><a href="ui-bootstrap.html">Bootstrap UI</a></li>--%>
<%--                                    <li><a href="ui-grid.html">Grid</a></li>--%>
<%--                                </ul>--%>
<%--                            </li>--%>

<%--                            <li>--%>
<%--                                <ul>--%>
<%--                                    <li>--%>
<%--                                        <span>Admin UI</span>--%>
<%--                                    </li>--%>
<%--                                    <li><a href="admin-sweet-alert2.html">Sweet Alert 2</a></li>--%>
<%--                                    <li><a href="admin-widgets.html">Widgets</a></li>--%>
<%--                                    <li><a href="admin-nestable.html">Nestable List</a></li>--%>
<%--                                    <li><a href="admin-rangeslider.html">Range Slider</a></li>--%>
<%--                                    <li><a href="admin-ratings.html">Ratings</a></li>--%>
<%--                                    <li><a href="admin-animation.html">Animation</a></li>--%>
<%--                                    <li><a href="calendar.html">Calendar</a></li>--%>
<%--                                </ul>--%>
<%--                            </li>--%>
<%--                        </ul>--%>
<%--                    </li>--%>

<%--                    <li class="has-submenu">--%>
<%--                        <a href="#">--%>
<%--                            <i class="mdi mdi-diamond-stone"></i>Components--%>
<%--                        </a>--%>
<%--                        <ul class="submenu">--%>
<%--                            <li class="has-submenu">--%>
<%--                                <a href="#">Forms--%>
<%--                                    <div class="arrow-down"></div>--%>
<%--                                </a>--%>
<%--                                <ul class="submenu">--%>
<%--                                    <li><a href="create.jsp">Form Elements</a></li>--%>
<%--                                    <li><a href="form-advanced.html">Form Advanced</a></li>--%>
<%--                                    <li><a href="form-validation.html">Form Validation</a></li>--%>
<%--                                    <li><a href="form-pickers.html">Form Pickers</a></li>--%>
<%--                                    <li><a href="form-wizard.html">Form Wizard</a></li>--%>
<%--                                    <li><a href="form-mask.html">Form Masks</a></li>--%>
<%--                                    <li><a href="form-summernote.html">Summernote</a></li>--%>
<%--                                    <li><a href="form-quilljs.html">Quilljs Editor</a></li>--%>
<%--                                    <li><a href="form-uploads.html">Multiple File Upload</a></li>--%>
<%--                                </ul>--%>
<%--                            </li>--%>
<%--                            <li class="has-submenu">--%>
<%--                                <a href="#">Charts--%>
<%--                                    <div class="arrow-down"></div>--%>
<%--                                </a>--%>
<%--                                <ul class="submenu">--%>
<%--                                    <li><a href="chart-flot.html">Flot Charts</a></li>--%>
<%--                                    <li><a href="chart-morris.html">Morris Charts</a></li>--%>
<%--                                    <li><a href="chart-google.html">Google Charts</a></li>--%>
<%--                                    <li><a href="chart-chartist.html">Chartist Charts</a></li>--%>
<%--                                    <li><a href="chart-chartjs.html">Chartjs Charts</a></li>--%>
<%--                                    <li><a href="chart-c3.html">C3 Charts</a></li>--%>
<%--                                    <li><a href="chart-sparkline.html">Sparkline Charts</a></li>--%>
<%--                                    <li><a href="chart-knob.html">Jquery Knob</a></li>--%>
<%--                                </ul>--%>
<%--                            </li>--%>

<%--                            <li class="has-submenu">--%>
<%--                                <a href="#">Email--%>
<%--                                    <div class="arrow-down"></div>--%>
<%--                                </a>--%>
<%--                                <ul class="submenu">--%>
<%--                                    <li><a href="email-inbox.html"> Inbox</a></li>--%>
<%--                                    <li><a href="email-read.html"> Read Mail</a></li>--%>
<%--                                    <li><a href="email-compose.html"> Compose Mail</a></li>--%>
<%--                                </ul>--%>
<%--                            </li>--%>

<%--                            <li class="has-submenu">--%>
<%--                                <a href="#">Icons--%>
<%--                                    <div class="arrow-down"></div>--%>
<%--                                </a>--%>
<%--                                <ul class="submenu">--%>
<%--                                    <li><a href="icons-colored.html">Colored Icons</a></li>--%>
<%--                                    <li><a href="icons-materialdesign.html">Material Design</a></li>--%>
<%--                                    <li><a href="icons-ionicons.html">Ion Icons</a></li>--%>
<%--                                    <li><a href="icons-fontawesome.html">Font awesome</a></li>--%>
<%--                                    <li><a href="icons-themifyicon.html">Themify Icons</a></li>--%>
<%--                                    <li><a href="icons-typicons.html">Typicons</a></li>--%>
<%--                                </ul>--%>
<%--                            </li>--%>

<%--                            <li class="has-submenu">--%>
<%--                                <a href="#">Tables--%>
<%--                                    <div class="arrow-down"></div>--%>
<%--                                </a>--%>
<%--                                <ul class="submenu">--%>
<%--                                    <li><a href="tables-basic.html">Basic Tables</a></li>--%>
<%--                                    <li><a href="tables-layouts.html">Tables Layouts</a></li>--%>
<%--                                    <li><a href="tables-datatable.html">Data Table</a></li>--%>
<%--                                    <li><a href="tables-responsive.html">Responsive Table</a></li>--%>
<%--                                    <li><a href="tables-tablesaw.html">Tablesaw Table</a></li>--%>
<%--                                    <li><a href="tables-editable.html">Editable Table</a></li>--%>
<%--                                </ul>--%>
<%--                            </li>--%>

<%--                            <li class="has-submenu">--%>
<%--                                <a href="#">Maps--%>
<%--                                    <div class="arrow-down"></div>--%>
<%--                                </a>--%>
<%--                                <ul class="submenu">--%>
<%--                                    <li><a href="maps-google.html">Google Maps</a></li>--%>
<%--                                    <li><a href="maps-vector.html">Vector Maps</a></li>--%>
<%--                                    <li><a href="maps-mapael.html">Mapael Maps</a></li>--%>
<%--                                </ul>--%>
<%--                            </li>--%>

<%--                        </ul>--%>
<%--                    </li>--%>

<%--                    <li class="has-submenu">--%>
<%--                        <a href="#">--%>
<%--                            <i class="mdi mdi-google-pages"></i>Pages--%>
<%--                        </a>--%>
<%--                        <ul class="submenu megamenu">--%>
<%--                            <li>--%>
<%--                                <ul>--%>
<%--                                    <li><a href="page-starter.html">Starter Page</a></li>--%>
<%--                                    <li><a href="page-login.html">Login</a></li>--%>
<%--                                    <li><a href="page-register.html">Register</a></li>--%>
<%--                                    <li><a href="page-logout.html">Logout</a></li>--%>
<%--                                    <li><a href="page-recoverpw.html">Recover Password</a></li>--%>
<%--                                </ul>--%>
<%--                            </li>--%>

<%--                            <li>--%>
<%--                                <ul>--%>
<%--                                    <li><a href="page-lock-screen.html">Lock Screen</a></li>--%>
<%--                                    <li><a href="page-confirm-mail.html">Confirm Mail</a></li>--%>
<%--                                    <li><a href="page-404.html">Error 404</a></li>--%>
<%--                                    <li><a href="page-404-alt.html">Error 404-alt</a></li>--%>
<%--                                    <li><a href="page-500.html">Error 500</a></li>--%>
<%--                                </ul>--%>
<%--                            </li>--%>
<%--                        </ul>--%>
<%--                    </li>--%>

<%--                    <li class="has-submenu">--%>
<%--                        <a href="#">--%>
<%--                            <i class="mdi mdi-book-multiple"></i>Extras--%>
<%--                        </a>--%>
<%--                        <ul class="submenu megamenu">--%>
<%--                            <li>--%>
<%--                                <ul>--%>
<%--                                    <li><a href="extras-profile.html">Profile</a></li>--%>
<%--                                    <li><a href="extras-sitemap.html">Sitemap</a></li>--%>
<%--                                    <li><a href="extras-about.html">About Us</a></li>--%>
<%--                                    <li><a href="extras-contact.html">Contact</a></li>--%>
<%--                                    <li><a href="extras-members.html">Members</a></li>--%>
<%--                                    <li><a href="extras-timeline.html">Timeline</a></li>--%>
<%--                                    <li><a href="extras-invoice.html">Invoice</a></li>--%>
<%--                                </ul>--%>
<%--                            </li>--%>

<%--                            <li>--%>
<%--                                <ul>--%>
<%--                                    <li><a href="extras-search-result.html">Search Result</a></li>--%>
<%--                                    <li><a href="extras-emailtemplate.html">Email Template</a></li>--%>
<%--                                    <li><a href="extras-maintenance.html">Maintenance</a></li>--%>
<%--                                    <li><a href="extras-coming-soon.html">Coming Soon</a></li>--%>
<%--                                    <li><a href="extras-faq.html">FAQ</a></li>--%>
<%--                                    <li><a href="extras-gallery.html">Gallery</a></li>--%>
<%--                                    <li><a href="extras-pricing.html">Pricing</a></li>--%>
<%--                                </ul>--%>
<%--                            </li>--%>
<%--                        </ul>--%>
<%--                    </li>--%>

<%--                    <li class="has-submenu">--%>
<%--                        <a href="#"> <i class="mdi mdi-comment-text"></i>Blog--%>
<%--                        </a>--%>
<%--                        <ul class="submenu">--%>
<%--                            <li><a href="blogs-dashboard.html">Dashboard</a></li>--%>
<%--                            <li><a href="blogs-blog-list.html">Blog List</a></li>--%>
<%--                            <li><a href="blogs-blog-column.html">Blog Column</a></li>--%>
<%--                            <li><a href="blogs-blog-post.html">Blog Post</a></li>--%>
<%--                            <li><a href="blogs-blog-add.html">Add Blog</a></li>--%>
<%--                        </ul>--%>
<%--                    </li>--%>

<%--                    <li class="has-submenu">--%>
<%--                        <a href="#"> <i class="mdi mdi-home-map-marker"></i>Real Estate--%>
<%--                        </a>--%>
<%--                        <ul class="submenu">--%>
<%--                            <li><a href="real-estate-dashboard.html">Dashboard</a></li>--%>
<%--                            <li><a href="real-estate-list.html">Property List</a></li>--%>
<%--                            <li><a href="real-estate-column.html">Property Column</a></li>--%>
<%--                            <li><a href="real-estate-detail.html">Property Detail</a></li>--%>
<%--                            <li><a href="real-estate-agents.html">Agents</a></li>--%>
<%--                            <li><a href="real-estate-profile.html">Agent Details</a></li>--%>
<%--                            <li><a href="real-estate-add.html">Add Property</a></li>--%>
<%--                        </ul>--%>
<%--                    </li>--%>

<%--                    <li class="has-submenu">--%>
<%--                        <a href="#"> <i class="mdi mdi-flip-horizontal"></i>Layouts--%>
<%--                        </a>--%>
<%--                        <ul class="submenu">--%>
<%--                            <li><a href="layouts-vertical.html">Vertical</a></li>--%>
<%--                            <li><a href="layouts-topbar-light.html">Topbar Light</a></li>--%>
<%--                            <li><a href="layouts-center-menu.html">Center Menu</a></li>--%>
<%--                            <li><a href="layouts-normal-header.html">Unsticky Header</a></li>--%>
<%--                        </ul>--%>
<%--                    </li>--%>

<%--                </ul>--%>
                <!-- End navigation menu -->

                <div class="clearfix"></div>
            </div>
            <!-- end #navigation -->
        </div>
        <!-- end container -->
    </div>
    <!-- end navbar-custom -->
</header>
