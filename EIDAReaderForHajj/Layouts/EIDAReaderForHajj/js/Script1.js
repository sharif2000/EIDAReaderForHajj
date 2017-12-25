function doReadPublicData() {
    var Ret = Initialize();
    if (Ret == false)
        return;

    Ret = ReadPublicData(true, true, true, true, true, true);
    if (Ret == false)
        return;

    $("#ef_idn_cn").val(GetEF_IDN_CN());
    $("#ef_non_mod_data").val(GetEF_NonModifiableData());
    $("#ef_mod_data").val(GetEF_ModifiableData());
    $("#ef_sign_image").val(GetEF_HolderSignatureImage());
    $("#ef_photo").val(GetEF_Photography());
    $("#ef_root_cert").val(GetEF_RootCertificate());
    $("#ef_home_address").val(GetEF_HomeAddressData());
    $("#ef_work_address").val(GetEF_WorkAddressData());

    $("#btnVerifyPubData").removeAttr("disabled");
    $("#msg p:last").html("Public data read successfully");
    $("#msg").show("fade", {}, 500);
}

function doSignData() {
    var Ret = Initialize();
    if (Ret == false)
        return;

    var pin = $("#txtPin").val();
    var data = $("#txtSignData").val();

    if (pin == null || pin == "" || pin.length != 4) {
        alert("Empty or invalid PIN size!");
        return;
    }

    if (data == null || data == "") {
        alert("Data field is empty!");
        return;
    }

    data = window.btoa(data);

    Ret = SignData(pin, data);
    if (Ret == "")
        return;

    $("#certificate").val(ExportSignCertificate());
    $("#signature").val(Ret);
    $("#btnVerifySignature").removeAttr("disabled");

    $("#btnVerifyPubData").removeAttr("disabled");
    $("#msg p:last").html("Data Signed successfully");
    $("#msg").show("fade", {}, 500);
}

function doSignChallenge() {
    var Ret = Initialize();
    if (Ret == false)
        return;

    var pin = $("#txtPin").val();
    if (pin == null || pin == "" || pin.length != 4) {
        alert("Empty or invalid PIN size!");
        return;
    }


    var challenge = "";
    $.ajax({
        url: "GenerateChallenge.aspx",
        type: "POST",
        async: false,
        dataType: 'text',
        context: document.body,
        success: function (data) {
            challenge = data;
        }
    });

    Ret = SignChallenge(pin, challenge);
    if (Ret == "")
        return;

    $("#certificate").val(ExportAuthCertificate());
    $("#signature").val(Ret);
    $("#btnVerifySignature").removeAttr("disabled");

    $("#msg p:last").html("Server Challenge Signed successfully");
    $("#msg").show("fade", {}, 500);
}

function verifySignature() {
    $("#form1").attr("action", "VerifySignature");
    $('#form1').submit();
}

function onSignChange(rd) {
    if (rd.value == "Auth")
        $("#TR_Data").hide();
    else
        $("#TR_Data").show();
}

function doSign() {
    if ($("#rdSign").is(':checked'))
        doSignData();
    else
        doSignChallenge();
}

