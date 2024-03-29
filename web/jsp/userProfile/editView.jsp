<%@page session="false"%>
<%@page import="model.mo.User"%>
<%@page import="java.util.List"%>

<%int i = 0;
    boolean loggedOn = (Boolean) request.getAttribute("loggedOn");
    User loggedUser = (User) request.getAttribute("loggedUser");
    String applicationMessage = (String) request.getAttribute("applicationMessage");
    String menuActiveLink = "Modifica profilo";

    User user = (User) request.getAttribute("user");
    String action=(user != null) ? "modify" : "insert";
%>

<!DOCTYPE html>
<html>
<head>
    <%@include file="/include/htmlHead.jsp"%>

    <script language="javascript">
        var status="<%=action%>"

        function DynamicFormCheck(e) {
            var EventTriggerName = (e.target.name);
            var EventTriggerValue = (e.target.value);

            if(isNaN(EventTriggerValue))
                alert("Il campo " + EventTriggerName + " richiede un numero");
        }

        function StaticFormCheck(){
            // var prezzoValue = (document.editProfileForm.price.value);
            // var quantityValue = (document.editProfileForm.quantity.value);
            // var alcoolValue = (document.editProfileForm.alcool.value);
            //
            // if(isNaN(prezzoValue)){
            //     alert("Il campo PREZZO richiede un numero");
            //     return false;
            // }
            //
            // if(isNaN(quantityValue)){
            //     alert("Il campo QUANTITY richiede un numero");
            //     return false;
            // }
            //
            // if(isNaN(alcoolValue)){
            //     alert("Il campo ALCOOL richiede un numero");
            //     return false;
            // }
            return true;
        }

        // function submitUser() {
        //     if (StaticFormCheck()) {
        //         alert("campi ok");
        //         document.editProfileForm.controllerAction.value = "UserManagement."+status;
        //         document.editProfileForm.submit();
        //     }
        // }

        // function goback() {
        //     document.backForm.submit();
        // }

        function mainOnLoadHandler() {
            // document.editProfileForm.addEventListener("submit", submitUser);
            // document.editProfileForm.Invia.addEventListener("click", submitUser);
            // document.editProfileForm.backButton.addEventListener("click", goback);
            // document.editProfileForm.price.addEventListener("change", DynamicFormCheck);
            // document.editProfileForm.quantity.addEventListener("change", DynamicFormCheck);
            // document.editProfileForm.alcool.addEventListener("change", DynamicFormCheck);

        }
    </script>
</head>
<body>
<%@include file="/include/header.jsp"%>
<main class="flex flex-col justify-center items-center pt-8 pb-8">
    <div class="w-full flex flex-row justify-center"><h1 class="my-4 uppercase tracking-wide font-medium text-gray-800 text-xl">Modifica Profilo</h1></div>
    <section class="w-full flex flex-row flex-no-wrap justify-around">
        <section class="order-1 flex flex-col flex-wrap m-4 w-1/2">
            <div class="float">
                <div class="float-right flex-row bg-gray-200 rounded-lg border-bg-gray-500 mx-2 my-4 p-4 w-2/3">
                    <div class="flex flex-col m-2">
                        <div class="border-b border-bg-gray-500">
                            <p class="font-bold pt-2 m-4">Info principali</p>
                        </div>
                        <div class="m-4">
                            <label class="block text-grey-darker text-sm font-bold mb-2" for="username">
                                Username
                            </label>
                            <input class="shadow appearance-none border rounded w-full py-2 px-3 text-grey-darker" form="editProfileForm" id="username" name="username" type="text" placeholder="mario123"
                                   value="<%=(user.getUsername() != null) ? user.getUsername() : ""%>" maxlength="32" >
                            <label class="block text-grey-darker text-sm font-bold my-2" for="username">
                                Password
                            </label>
                            <input class="shadow appearance-none border rounded w-full py-2 px-3 text-grey-darker" form="editProfileForm" id="password" name="password" type="password" placeholder="*********"
                                   maxlength="32" >

                            <div class="flex flex-row flex-no-wrap justify-between my-2 py-2 w-full">
                                <div class="mr-2">
                                    <label class="block text-grey-darker text-sm font-bold mb-2" for="cvc">
                                        Nome
                                    </label>
                                    <input class="shadow appearance-none border rounded w-full py-2 px-3 text-grey-darker" form="editProfileForm" id="name" name="name" type="text" placeholder="Mario"
                                           value="<%=(user.getName() != null) ? user.getName() : ""%>" maxlength="40" >
                                </div>
                                <div class="ml-2">
                                    <label class="block text-grey-darker text-sm font-bold mb-2" for="exp_date">
                                        Cognome
                                    </label>
                                    <input class="shadow appearance-none border rounded w-full py-2 px-3 text-grey-darker" form="editProfileForm" id="surname" name="surname" type="text" placeholder="Rossi"
                                           value="<%=(user.getSurname() != null) ? user.getSurname() : ""%>" maxlength="40" >
                                </div>
                            </div>

                            <div class="flex flex-row flex-no-wrap justify-between my-2 py-2 w-full">
                                <div class="mr-2">
                                    <label class="block text-grey-darker text-sm font-bold mb-2" for="cvc">
                                        Email
                                    </label>
                                    <input class="shadow appearance-none border rounded w-full py-2 px-3 text-grey-darker" form="editProfileForm" id="email" name="email" type="text" placeholder="mario.rossi@example.com"
                                           value="<%=(user.getEmail() != null) ? user.getEmail() : ""%>" maxlength="40" >
                                </div>
                                <div class="ml-2">
                                    <label class="block text-grey-darker text-sm font-bold mb-2" for="exp_date">
                                        Telefono
                                    </label>
                                    <input class="shadow appearance-none border rounded w-full py-2 px-3 text-grey-darker" form="editProfileForm" id="phone" name="phone" type="text" placeholder="333 1231234"
                                           value="<%=(user.getPhone() != null) ? user.getPhone() : ""%>" maxlength="40" >
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
<%--                <div class="float-right flex-row bg-gray-200 rounded-lg border-bg-gray-500 mx-2 my-4 p-4 w-2/3">--%>
<%--                    <div class="flex flex-col m-2">--%>
<%--                        <p class="font-bold pt-2 m-4 border-b border-bg-gray-400">Info di spedizione</p>--%>
<%--                        <div class="m-4">--%>
<%--                            <label class="block text-grey-darker text-sm font-bold mb-2" for="street">--%>
<%--                                Via--%>
<%--                            </label>--%>
<%--                            <input class="shadow appearance-none border rounded w-full py-2 px-3 text-grey-darker" form="editProfileForm" id="street" name="street" type="text" placeholder="Via Rossi"--%>
<%--                                   value="<%=(user.getStreet() != null) ? user.getStreet() : ""%>" maxlength="50" >--%>
<%--                            <div class="flex flex-row flex-no-wrap justify-between my-2 py-2 w-full">--%>
<%--                                <div class="mr-2">--%>
<%--                                    <label class="block text-grey-darker text-sm font-bold mb-2" for="civic">--%>
<%--                                        Civico--%>
<%--                                    </label>--%>
<%--                                    <input class="shadow appearance-none border rounded w-full py-2 px-3 text-grey-darker" form="editProfileForm" id="civic" name="civic" type="text" placeholder="1"--%>
<%--                                           value="<%=(user.getCivic() != null) ? user.getCivic() : ""%>"maxlength="10" >--%>
<%--                                </div>--%>
<%--                                <div class="mx-2">--%>
<%--                                    <label class="block text-grey-darker text-sm font-bold mb-2" for="cap">--%>
<%--                                        CAP--%>
<%--                                    </label>--%>
<%--                                    <input class="shadow appearance-none border rounded w-full py-2 px-3 text-grey-darker" form="editProfileForm" id="cap" name="cap" type="text" placeholder="12345"--%>
<%--                                           value="<%=(user.getCap() != 0) ? user.getCap() : ""%>"maxlength="5" >--%>
<%--                                </div>--%>
<%--                                <div class="ml-2">--%>
<%--                                    <label class="block text-grey-darker text-sm font-bold mb-2" for="city">--%>
<%--                                        Citta--%>
<%--                                    </label>--%>
<%--                                    <input class="shadow appearance-none border rounded w-full py-2 px-3 text-grey-darker" form="editProfileForm" id="city" name="city" type="text" placeholder="Roma"--%>
<%--                                           value="<%=(user.getCity() != null) ? user.getCity() : ""%>" maxlength="30" >--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
            </div>
        </section>
        <section class="order-2 flex flex-col flex-wrap m-4 w-1/2">
            <div class="float">
                <div class="float-left flex-row bg-gray-100 rounded-lg border-bg-gray-500 mx-2 my-4 p-4 w-2/3">
                    <div class="flex flex-col m-2">
                        <div class="border-b border-bg-gray-500">
                            <p class="font-bold pt-2 m-4">Info di pagamento</p>
                        </div>
                        <div class="m-4">
                            <label class="block text-grey-darker text-sm font-bold mb-2" for="card_n">
                                Numero di Carta
                            </label>
                            <input class="shadow appearance-none border rounded w-full py-2 px-3 text-grey-darker" form="editProfileForm" id="card_n" name="card_n" type="text" placeholder="1234 1234 1234 1234"
                                   value="<%=(user.getCard_n() != null) ? user.getCard_n() : ""%>" maxlength="16" >
                            <div class="flex flex-row flex-no-wrap justify-between my-2 py-2 w-full">
                                <div class="mr-2">
                                    <label class="block text-grey-darker text-sm font-bold mb-2" for="cvc">
                                        CVC/CCV
                                    </label>
                                    <input class="shadow appearance-none border rounded w-full py-2 px-3 text-grey-darker" form="editProfileForm" id="cvc" name="cvc" type="text" placeholder="567"
                                           value="<%=(user.getCvc() != 0) ? user.getCvc() : ""%>" maxlength="3" >
                                </div>
                                <div class="ml-2">
                                    <label class="block text-grey-darker text-sm font-bold mb-2" for="exp_date">
                                        Data di scadenza
                                    </label>
                                    <input class="shadow appearance-none border rounded w-full py-2 px-3 text-grey-darker" form="editProfileForm" id="exp_date" name="exp_date" type="text" placeholder="12/34"
                                           value="<%=(user.getExp_date() != null) ? user.getExp_date() : ""%>" maxlength="5" >
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="float-left flex-row bg-gray-100 rounded-lg border-bg-gray-500 mx-2 my-4 p-4 w-2/3">
                    <div class="flex flex-col m-2">
                        <div class="border-b border-bg-gray-500"><p class="font-bold pt-2 m-4">Info di spedizione</p></div>
                        <div class="m-4">
                            <label class="block text-grey-darker text-sm font-bold mb-2" for="street">
                                Via
                            </label>
                            <input class="shadow appearance-none border rounded w-full py-2 px-3 text-grey-darker" form="editProfileForm" id="street" name="street" type="text" placeholder="Via Rossi"
                                   value="<%=(user.getStreet() != null) ? user.getStreet() : ""%>" maxlength="50" >
                            <div class="flex flex-row flex-no-wrap justify-between my-2 py-2 w-full">
                                <div class="mr-2">
                                    <label class="block text-grey-darker text-sm font-bold mb-2" for="civic">
                                        Civico
                                    </label>
                                    <input class="shadow appearance-none border rounded w-full py-2 px-3 text-grey-darker" form="editProfileForm" id="civic" name="civic" type="text" placeholder="1"
                                           value="<%=(user.getCivic() != null) ? user.getCivic() : ""%>"maxlength="10" >
                                </div>
                                <div class="mx-2">
                                    <label class="block text-grey-darker text-sm font-bold mb-2" for="cap">
                                        CAP
                                    </label>
                                    <input class="shadow appearance-none border rounded w-full py-2 px-3 text-grey-darker" form="editProfileForm" id="cap" name="cap" type="text" placeholder="12345"
                                           value="<%=(user.getCap() != 0) ? user.getCap() : ""%>"maxlength="5" >
                                </div>
                                <div class="ml-2">
                                    <label class="block text-grey-darker text-sm font-bold mb-2" for="city">
                                        Citta
                                    </label>
                                    <input class="shadow appearance-none border rounded w-full py-2 px-3 text-grey-darker" form="editProfileForm" id="city" name="city" type="text" placeholder="Roma"
                                           value="<%=(user.getCity() != null) ? user.getCity() : ""%>" maxlength="30" >
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </section>
    <div class="w-full flex flex-row justify-center">
        <button class="bg-gray-700 hover:bg-blue-dark text-white font-bold py-2 px-4 rounded-full" type="submit" form="editProfileForm">
            Effettua modifiche
        </button>
    </div>

    <form name="editProfileForm" id="editProfileForm" action="Dispatcher" method="post">
        <input type="hidden" name="controllerAction" value="UserProfile.modify"/>
    </form>

    <form name="backForm" method="post" action="Dispatcher">
        <input type="hidden" name="controllerAction" value="UserProfile.view"/>
    </form>

</main>
<%@include file="/include/footer.jsp"%>
</body>

</html>
