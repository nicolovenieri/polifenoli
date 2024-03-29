<%@page session="false"%>
<%@page import="model.mo.User"%>
<%@page import="model.mo.Wine"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>

<%int i = 0;
    boolean loggedOn = (Boolean) request.getAttribute("loggedOn");
    User loggedUser = (User) request.getAttribute("loggedUser");
    String applicationMessage = (String) request.getAttribute("applicationMessage");
    String menuActiveLink = (String) request.getParameter("category");
    List<Wine> wines = (List<Wine>) request.getAttribute("wines");
%>

<!DOCTYPE html>
<html>
<head>
    <%@include file="/include/htmlHead.jsp"%>
    <script language="javascript">

        function productViewFormFunc(wine_id) {
            f = document.productViewForm;
            f.wine_id.value = wine_id;
            f.requestSubmit();
        }

        function AddToCart(wine_id) {
            alert("Aggiunto al carrello");
            document.AddToCartForm.wine_id.value = wine_id;
            document.AddToCartForm.requestSubmit();
        }

        function AddToWishlist(wine_id) {
            alert("Aggiunto alla wishlist");
            document.AddToWishlistForm.wine_id.value = wine_id;
            document.AddToWishlistForm.requestSubmit();
        }

        function mainOnLoadHandler() {}

    </script>
</head>
<body>
<%@include file="/include/header.jsp"%>
<div class="w-full flex justify-center">
    <div class="w-1/6 flex flex-row flex-no-wrap justify-between items-center m-4 p-2">
        <div class="flex items-center" id="store-nav-content">
            <form id="searchForm" name="searchForm" action="Dispatcher" method="post">
                <input type="hidden" name="controllerAction" value="HomeManagement.searchView">
                <div class="pt-2 relative mx-auto text-gray-600">
                    <input class="border-2 border-gray-300 bg-white h-10 px-5 pr-16 rounded-lg text-sm focus:outline-none"
                           type="search" id="searchString" name="searchString" placeholder="Search">
                    <button type="submit" form="searchForm" class="absolute right-0 top-0 mt-5 mr-4">
                        <svg class="text-gray-600 h-4 w-4 fill-current" xmlns="http://www.w3.org/2000/svg"
                             xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" id="Capa_1" x="0px" y="0px"
                             viewBox="0 0 56.966 56.966" style="enable-background:new 0 0 56.966 56.966;" xml:space="preserve"
                             width="512px" height="512px">
                                 <path d="M55.146,51.887L41.588,37.786c3.486-4.144,5.396-9.358,5.396-14.786c0-12.682-10.318-23-23-23s-23,10.318-23,23  s10.318,23,23,23c4.761,0,9.298-1.436,13.177-4.162l13.661,14.208c0.571,0.593,1.339,0.92,2.162,0.92  c0.779,0,1.518-0.297,2.079-0.837C56.255,54.982,56.293,53.08,55.146,51.887z M23.984,6c9.374,0,17,7.626,17,17s-7.626,17-17,17  s-17-7.626-17-17S14.61,6,23.984,6z" />
                          </svg>
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>
<main class="bg-white">
    <div class="container mx-auto flex flex-wrap pb-12">
        <nav id="store" class="w-full z-30 top-0 px-6 py-1">
            <div class="w-full container mx-auto flex flex-wrap items-center justify-between mt-0 px-2 py-3">
                <p class="uppercase tracking-wide no-underline hover:no-underline font-medium text-gray-800 text-xl">Categoria: <%=(String) request.getParameter("category")%></p>
            </div>
        </nav>
        <%for (i = 0; i < wines.size(); i++) {%>
        <div class="relative w-full md:w-1/3 xl:w-1/4 sm:w-1/3 p-6 flex flex-col">
            <%if(loggedOn){%>
            <div>
                <a class="absolute top-0 right-0 rounded-full bg-white z-50 mt-8 mr-8" href="javascript:AddToCart(<%=wines.get(i).getWineId()%>)">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"><path class="heroicon-ui fill-current text-gray-700" d="M17 11a1 1 0 010 2h-4v4a1 1 0 01-2 0v-4H7a1 1 0 010-2h4V7a1 1 0 012 0v4h4z"/></svg>
                </a>
                <a class="absolute top-0 right-0 rounded-full bg-transparent z-50 mt-8 mr-16" href="javascript:AddToWishlist(<%=wines.get(i).getWineId()%>)">
                    <svg xmlns="http://www.w3.org/2000/svg" class="heroicon-ui fill-current text-red-400" width="24" height="24" viewBox="0 0 20 20"><path d="M10 3.22l-.61-.6a5.5 5.5 0 00-7.78 7.77L10 18.78l8.39-8.4a5.5 5.5 0 00-7.78-7.77l-.61.61z"/></svg>
                </a>
            </div>
            <%}%>
            <a id="product-image" href="javascript:productViewFormFunc(<%=wines.get(i).getWineId()%>)">
                <img src="<%=wines.get(i).getProductImage()%>" class="hover:shadow-lg rounded" alt="stock wine image">
                <p class="pt-3 flex items-center justify-between text-gray-900 font-medium"><%=wines.get(i).getName()%></p>
                <p class="pt-1 font-light text-xl"><%=wines.get(i).getPrice()%> &euro;</p>
            </a>
        </div>
        <%}%>
    </div>

    <form name="productViewForm" method="post" action="Dispatcher">
        <input type="hidden" name="wine_id"/>
        <input type="hidden" name="controllerAction" value="HomeManagement.productView"/>
    </form>

    <form name="AddToCartForm" method="post" action="Dispatcher">
        <input type="hidden" name="wine_id"/>
        <input type="hidden" name="controllerAction" value="CartManagement.AddWine"/>
        <input type="hidden" name="viewUrl" value="homeManagement/view"/>
    </form>

    <form name="AddToWishlistForm" method="post" action="Dispatcher">
        <input type="hidden" name="wine_id"/>
        <input type="hidden" name="controllerAction" value="WishlistManagement.AddWine"/>
        <input type="hidden" name="viewUrl" value="homeManagement/view"/>
    </form>

</main>
<%@include file="/include/footer.jsp"%>
</html>
