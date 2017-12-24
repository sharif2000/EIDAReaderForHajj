<%@ Assembly Name="$SharePoint.Project.AssemblyFullName$" %>
<%@ Import Namespace="Microsoft.SharePoint.ApplicationPages" %>
<%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewHajjFormWithEIDAReader.aspx.cs" Inherits="EIDAReaderForHajj.Layouts.EIDAReaderForHajj.NewHajjFormWithEIDAReader" DynamicMasterPageFile="~masterurl/default.master" %>

<asp:Content ID="PageHead" ContentPlaceHolderID="PlaceHolderAdditionalPageHead" runat="server">
    <script type="text/javascript" language="javascript" src="js/base64.js"></script>
    <script type="text/javascript" language="javascript" src="js/jquery-1.8.2.js"></script>
    <script type="text/javascript" language="javascript" src="js/errors.js"></script>
    <script type="text/javascript" language="javascript" src="js/zfcomponent.js"></script>
    <script type="text/javascript" language="javascript" src="js/jquery-ui-1.9.0.js"></script>
    <style type="text/css">
        .auto-style1 {
            font-size: xx-small;
        }
        .auto-style2 {
            color: #990000;
        }
        .auto-style4 {
            border-style: solid;
            border-width: 1px;
            padding: 1px 4px;
            color: #990000;
        }
        .auto-style6 {
        }
        .auto-style7 {
        }
        .auto-style8 {
        }
        .auto-style9 {
        }
        .auto-style10 {
        }
        .auto-style11 {
            text-align: right;
            font-size: x-large;
            float: left;
        }
        .image {
   content:url(http://zf-sp/Style%20Library/Images/logo.png);
}
        .auto-style12 {
            color: #FFFFFF;
            font-size: large;
        }
        .auto-style13 {
            width: 64px;
        }
        .auto-style14 {
            width: 135px;
        }
        .auto-style15 {
            width: 133px;
        }
        .auto-style16 {
            width: 176px;
        }
        .auto-style17 {
            width: 92px;
        }
        .auto-style18 {
            width: 176px;
            height: 26px;
        }
        .auto-style19 {
            width: 135px;
            height: 26px;
        }
        .auto-style20 {
            width: 92px;
            height: 26px;
        }
        .auto-style21 {
            width: 133px;
            height: 26px;
        }
        table {
    font-family: arial, sans-serif;
    border-collapse: collapse;
    width: 100%;
}

td, th {
    border: 1px solid #dddddd;
    text-align: left;
    padding: 8px;
}

tr:nth-child(even) {
    background-color: #dddddd;
}

    </style>
</asp:Content>

<asp:Content ID="Main" ContentPlaceHolderID="PlaceHolderMain" runat="server">
  
    <input type="hidden" id="ef_idn_cn" name="ef_idn_cn" value="" />
    <input type="hidden" id="ef_non_mod_data" name="ef_non_mod_data" value="" />
    <input type="hidden" id="ef_mod_data" name="ef_mod_data" value="" />
    <input type="hidden" id="ef_sign_image" name="ef_sign_image" value="" />
    <input type="hidden" id="ef_photo" name="ef_photo" value="" />
    <input type="hidden" id="ef_root_cert" name="ef_root_cert" value="" />
    <input type="hidden" id="ef_home_address" name="ef_home_address" value="" />
    <input type="hidden" id="ef_work_address" name="ef_work_address" value="" />
    <input type="hidden" id="certificate" name="certificate" value="" />
    <input type="hidden" id="signature" name="signature" value="" />


    <%--<div id="left_column">
                    <input type="button" class="submitButton" value="Read Public Data" onclick="doReadPublicData();" />
                    <asp:Button ID="btnVerifyPubData" runat="server" Text="Verify and Parse"
                        CssClass="submitButton" OnClick="btnVerifyPubData_Click" />
                    
    <asp:Button ID="Button1" PostBackUrl="http://zf-sp/orgchart/ProgramsDepartment/hajj/Lists/List21/AllItems.aspx" runat="server" Text="Next" Width="130px" />
                </div>--%>
    <br/>
    <h3 class="auto-style2">Card Holder Information</h3>
    <div style="padding-left: 30px; font-size: 8pt">
    <table align="center" style=" width:95%; height:80%; border-color:brown; border-style: solid; border-width: 1px; padding: 1px 4px; font-size: medium; background-color:lightgray">
        <tr>
            <td class="auto-style10"><strong>Name</strong></td>
            <td style="padding-right: 20px;" class="auto-style7"><asp:Label runat="server" ID="FullName" CssClass="auto-style2"/></td>
        
            <td class="auto-style8"><strong>IDN:&nbsp;&nbsp;&nbsp;&nbsp;</strong></td>
            <td class="auto-style7"><asp:Label runat="server" ID="IDN" CssClass="auto-style2"></asp:Label></td>
            
            <td class="auto-style8"><strong>Mother Name:&nbsp;</strong></td>
            <td style="padding-right: 20px;" class="auto-style7"><asp:Label runat="server" ID="MotherName" CssClass="auto-style2"/></td>
        </tr>
        <tr>
            <td class="auto-style10"><strong>Name (Ar)</strong></td>
            <td style="padding-right: 20px;" class="auto-style7"><asp:Label runat="server" ID="FullName_ar" CssClass="auto-style2"/></td>
            
            <td class="auto-style8"><strong>Card Number:&nbsp;</strong></td>
            <td class="auto-style7"><asp:Label runat="server" ID="CardNumber" CssClass="auto-style2"/></td>
            
            <td class="auto-style8"><strong>Mother Name (Ar):&nbsp;</strong></td>
            <td class="auto-style7"><asp:Label runat="server" ID="MotherName_ar" CssClass="auto-style2"/></td>
            
        </tr>
        <tr>
            <td class="auto-style10"><strong>Title:&nbsp;</strong></td>
            <td class="auto-style7"><asp:Label runat="server" ID="lblTitle" CssClass="auto-style2"/></td>
            
            <td class="auto-style8"><strong>Nationality:&nbsp;</strong></td>
            <td class="auto-style7"><asp:Label runat="server" ID="Nationality" CssClass="auto-style2"/></td>
            
             <td class="auto-style8"><strong>Family ID:&nbsp;</strong></td>
            <td class="auto-style7"><asp:Label runat="server" ID="FamilyId" CssClass="auto-style2"/></td>
        </tr>
        <tr>
            <td class="auto-style10"><strong>Title(Ar):&nbsp;</strong></td>
            <td class="auto-style7"><asp:Label runat="server" ID="Title_ar" CssClass="auto-style2"/></td>
        
            <td class="auto-style8"><strong>Nationality(Ar):&nbsp;</strong></td>
            <td class="auto-style7"><asp:Label runat="server" ID="Nationality_ar" CssClass="auto-style2"/></td>
            
            <td class="auto-style9"></td>
            <td class="auto-style9"></td>
        </tr>
        <tr>
            <td class="auto-style9"><strong>Issue Date:&nbsp;</strong></td>
            <td class="auto-style9"><asp:Label runat="server" ID="IssueDate" CssClass="auto-style2"/></td>
            
            <td class="auto-style9"><strong>Sex:&nbsp;</strong></td>
            <td class="auto-style9"><asp:Label runat="server" ID="Sex" CssClass="auto-style2"/></td>
            
            <td class="auto-style9"><strong>Sponsor Type:&nbsp;</strong></td>
            <td class="auto-style9"><asp:Label runat="server" ID="SponsorType" CssClass="auto-style2"/></td>
        </tr>
        <tr>
            <td class="auto-style9"><strong>Expiry Date:&nbsp;</strong></td>
            <td class="auto-style9"><asp:Label runat="server" ID="ExpiryDate" CssClass="auto-style2"/></td>
            
            <td class="auto-style9"><strong>Date of Birth:&nbsp;</strong></td>
            <td class="auto-style9"><asp:Label runat="server" ID="DoB" CssClass="auto-style2"/></td>
            
            <td class="auto-style9"><strong>Sponsor Name:&nbsp;</strong></td>
            <td class="auto-style9"><asp:Label runat="server" ID="SponsorName" CssClass="auto-style2"/></td>
        </tr>
        <tr>
            <td class="auto-style9"><strong>Marital Status:&nbsp;</strong></td>
            <td class="auto-style9"><asp:Label runat="server" ID="MaritalStatus" CssClass="auto-style2"/></td>
            
            <td class="auto-style9"><strong>Husband IDN:&nbsp;</strong></td>
            <td class="auto-style9"><asp:Label runat="server" ID="HusbandIDN" CssClass="auto-style2"/></td>
            
            <td class="auto-style9"><strong>Sponsor Number:&nbsp;</strong></td>
            <td class="auto-style9"><asp:Label runat="server" ID="SponsorUnifiedNumber" CssClass="auto-style2"/></td>
        </tr>
        
        <tr>
            <td class="auto-style9"><strong>Residency Type:&nbsp;</strong></td>
            <td class="auto-style9"><asp:Label runat="server" ID="ResidencyType" CssClass="auto-style2"/></td>
       
            <td class="auto-style9"><strong>Residency Number:&nbsp;</strong></td>
            <td class="auto-style9"><asp:Label runat="server" ID="ResidencyNumber" CssClass="auto-style2"/></td>
            
            <td class="auto-style9"><strong>Residency Expiry:&nbsp;</strong></td>
            <td class="auto-style9"><asp:Label runat="server" ID="ResidencyExpiryDate" CssClass="auto-style2"/></td>
        </tr>
        
        <tr>
            <td class="auto-style9"><strong>ID Type:&nbsp;</strong></td>
            <td class="auto-style9"><asp:Label runat="server" ID="IdType" CssClass="auto-style2"/></td>
       
            <td class="auto-style9"><strong>Occupation:&nbsp;</strong></td>
            <td class="auto-style9"><asp:Label runat="server" ID="Occupation" CssClass="auto-style2"/></td>
            
            <td class="auto-style9"><strong>Occupation Field:&nbsp;</strong></td>
            <td class="auto-style9"><asp:Label runat="server" ID="OccupationField" CssClass="auto-style2"/></td>
        </tr>
        <tr>
            <td class="auto-style9"><strong>Photo</strong></td>
            <td class="auto-style9">
                <img alt="Photo" src="images/UnknownPerson.png" id="PhotoBase64" runat="server" class="auto-style4"  height="150" width="150" />
            </td>
        
            <td colspan="2" class="auto-style6"><strong>Signature Image</strong></td>
            <td colspan="2">
            <img alt="Signature Image" src="images/UnknownPerson.png" id="SignaturePhotoBase64" runat="server" class="auto-style4" height="150" width="150" />
            </td>
        </tr>
    </table>
        <h3 class="auto-style2">Complete Personal Data</h3>
        
            <table align="center" style="width: 95%; height: 80%; border-color: brown; border-style: solid; border-width: 1px; padding: 1px 4px; font-size: medium; background-color: lightgray; text-align:right">
            <tr>
                <td class="auto-style16">
                    <asp:TextBox ID="TextBox27" runat="server" Width="209px"></asp:TextBox>
                </td>
                <td class="auto-style14">: سنة الطلب</td>
                <td class="auto-style17">
                    <asp:TextBox ID="Req_ID" runat="server" Width="209px"></asp:TextBox>
                </td>
                <td class="auto-style15">: رقم الطلب</td>
            </tr>
             <tr>
                <td class="auto-style16">
                    <asp:TextBox ID="TextBox28" runat="server" Width="209px"></asp:TextBox>
                 </td>
                <td class="auto-style14">رقم المتحرك</td>
                <td class="auto-style17">
                    <asp:TextBox ID="Married" runat="server" Width="209px"></asp:TextBox>
                 </td>
                 <td class="auto-style15">: الحالة الأجتماعية</td>
             </tr>
                <tr>
                <td class="auto-style16">
                    <asp:TextBox ID="TextBox29" runat="server" Width="209px"></asp:TextBox>
                 </td>
                <td class="auto-style14">زقم المنزل</td>
                <td class="auto-style17">
                    <asp:TextBox ID="TextBox42" runat="server" Width="209px"></asp:TextBox>
                 </td>
                 <td class="auto-style15">صندوق بريد</td>
            </tr>
             <tr>
                <td class="auto-style16">
                    <asp:TextBox ID="TextBox30" runat="server" Width="209px"></asp:TextBox>
                 </td>
                <td class="auto-style14">رقم العمل</td>
                <td class="auto-style17">
                    <asp:TextBox ID="TextBox43" runat="server" Width="209px"></asp:TextBox>
                 </td>
                 <td class="auto-style15">البريد الإلكترونى</td>
            </tr>
             <tr>
                <td class="auto-style16">
                    <asp:TextBox ID="TextBox31" runat="server" Width="209px"></asp:TextBox>
                 </td>
                <td class="auto-style14">رقم الجواز</td>
                <td class="auto-style17">
                    <asp:TextBox ID="TextBox44" runat="server" Width="209px"></asp:TextBox>
                 </td>
                 <td class="auto-style15">المستوي التعليمى</td>
            </tr>
             <tr>
                <td class="auto-style16">
                    <asp:TextBox ID="TextBox32" runat="server" Width="209px"></asp:TextBox>
                 </td>
                <td class="auto-style14">مكان الأصدار</td>
                <td class="auto-style17">
                    <asp:TextBox ID="TextBox53" runat="server" Width="209px"></asp:TextBox>
                 </td>
                 <td class="auto-style15">تاريخ صلاحية الهوية</td>
            </tr>
             <tr>
                <td class="auto-style16">
                    <asp:TextBox ID="TextBox33" runat="server" Width="209px"></asp:TextBox>
                 </td>
                <td class="auto-style14">المدينة</td>
                <td class="auto-style17">
                    <asp:TextBox ID="TextBox46" runat="server" Width="209px"></asp:TextBox>
                 </td>
                 <td class="auto-style15">الإمارة </td>
            </tr>
             <tr>
                <td class="auto-style16">
                    <asp:TextBox ID="TextBox34" runat="server" Width="209px"></asp:TextBox>
                 </td>
                <td class="auto-style14">مكان العمل</td>
                <td class="auto-style17">
                    <asp:TextBox ID="TextBox47" runat="server" Width="209px"></asp:TextBox>
                 </td>
                 <td class="auto-style15">العنوان</td>
            </tr>
             <tr>
                <td class="auto-style18">
                    <asp:TextBox ID="TextBox35" runat="server" Width="209px"></asp:TextBox>
                 </td>
                <td class="auto-style19">ذو أحتياجات خاصة</td>
                <td class="auto-style20">
                    <asp:TextBox ID="TextBox48" runat="server" Width="209px"></asp:TextBox>
                 </td>
                 <td class="auto-style21">الوظيفة</td>
            </tr>
             <tr>
                <td class="auto-style16">
                    <asp:TextBox ID="TextBox36" runat="server" Width="209px"></asp:TextBox>
                 </td>
                <td class="auto-style14">يحتاج كرسي</td>
                <td class="auto-style17">
                    <asp:TextBox ID="TextBox49" runat="server" Width="209px"></asp:TextBox>
                 </td>
                 <td class="auto-style15">يحتاج حافلة</td>
            </tr>
             <tr>
                <td class="auto-style16">
                    <asp:TextBox ID="TextBox37" runat="server" Width="209px"></asp:TextBox>
                 </td>
                <td class="auto-style14">الأمراض</td>
                <td class="auto-style17">
                    <asp:TextBox ID="TextBox50" runat="server" Width="209px"></asp:TextBox>
                 </td>
                 <td class="auto-style15">يدخن</td>
            </tr>
             <tr>
                <td class="auto-style16">
                    <asp:TextBox ID="TextBox38" runat="server" Width="209px"></asp:TextBox>
                 </td>
                <td class="auto-style14">نوع الحج</td>
                <td class="auto-style17">
                    <asp:TextBox ID="TextBox51" runat="server" Width="209px"></asp:TextBox>
                 </td>
                 <td class="auto-style15">حملة الحج</td>
            </tr>
             <tr>
                <td class="auto-style16">
                    <asp:TextBox ID="TextBox39" runat="server" Width="209px"></asp:TextBox>
                 </td>
                <td class="auto-style14">كم مرة زار المدينة</td>
                <td class="auto-style17">
                    <asp:TextBox ID="TextBox52" runat="server" Width="209px"></asp:TextBox>
                 </td>
                 <td class="auto-style15">كم مرة قام بإداء العمرة</td>
            </tr>
                <tr>
                    <td class="auto-style16">
                    <asp:TextBox ID="TextBox62" runat="server" Width="209px"></asp:TextBox>
                    </td>
                    <td class="auto-style15">ملاحظات علي الدخل الشهرى</td>
                    <td class="auto-style16">
                    <asp:TextBox ID="TextBox54" runat="server" Width="209px"></asp:TextBox>
                    </td>
                    <td class="auto-style15">الدخل الشهرى</td>
                </tr>
                 <tr>
                    <td class="auto-style16">
                    <asp:TextBox ID="TextBox63" runat="server" Width="209px"></asp:TextBox>
                     </td>
                    <td class="auto-style15">المبلغ المدفوع</td>
                    <td class="auto-style16">
                    <asp:TextBox ID="TextBox56" runat="server" Width="209px"></asp:TextBox>
                     </td>
                    <td class="auto-style15">المبلغ المقترح للمساهمة</td>
                </tr> 
                <tr>
                    <td class="auto-style16">
                    <asp:TextBox ID="TextBox64" runat="server" Width="209px"></asp:TextBox>
                    </td>
                    <td class="auto-style15">المبلغ المدفوع للهدى</td>
                    <td class="auto-style16">
                    <asp:TextBox ID="TextBox55" runat="server" Width="209px"></asp:TextBox>
                    </td>
                    <td class="auto-style15">مبلغ الهدي</td>
                </tr> 
                <tr>
                    <td class="auto-style16">
                    <asp:TextBox ID="TextBox65" runat="server" Width="209px"></asp:TextBox>
                    </td>
                    <td class="auto-style15">ملاحظات للطباعة</td>
                    <td class="auto-style16">
                    <asp:TextBox ID="TextBox57" runat="server" Width="209px"></asp:TextBox>
                    </td>
                    <td class="auto-style15">ملاحظات على الحاج</td>
                </tr>
                <tr>
                    <td class="auto-style16">
                    <asp:TextBox ID="TextBox66" runat="server" Width="209px"></asp:TextBox>
                    </td>
                    <td class="auto-style15">مدة الإقامة فى الدولة</td>
                    <td class="auto-style16">
                    <asp:TextBox ID="TextBox58" runat="server" Width="209px"></asp:TextBox>
                    </td>
                    <td class="auto-style15">الذهاب للمدينة</td>
                </tr>
                <tr>
                    <td class="auto-style16">
                    <asp:TextBox ID="TextBox67" runat="server" Width="209px"></asp:TextBox>
                    </td>
                    <td class="auto-style15">البعثة</td>
                    <td class="auto-style16">
                    <asp:TextBox ID="TextBox59" runat="server" Width="209px"></asp:TextBox>
                    </td>
                    <td class="auto-style15">مكان التسجيل</td>
                </tr>
                <tr>
                    <td class="auto-style16">
                    <asp:TextBox ID="TextBox68" runat="server" Width="209px"></asp:TextBox>
                    </td>
                    <td class="auto-style15">هل تم ادخال الطلب من قبل</td>
                    <td class="auto-style16">
                    <asp:TextBox ID="TextBox60" runat="server" Width="209px"></asp:TextBox>
                    </td>
                    <td class="auto-style15">الجهة التابع لها</td>
                </tr>
                <tr>
                    <td class="auto-style16">
                    <asp:TextBox ID="TextBox69" runat="server" Width="209px"></asp:TextBox>
                    </td>
                    <td class="auto-style15">حالة الطلب</td>
                    <td class="auto-style16">
                    <asp:TextBox ID="TextBox61" runat="server" Width="209px"></asp:TextBox>
                    </td>
                    <td class="auto-style15">تاريخ آخر حجة</td>
                </tr>
        </table>
   </div>
    
    <%--<table  cellpadding="2" cellspacing="2" align="center" style="height: 0px; width: 0px; color: #FFFFFF;">
        <tr>
            <td align="center" class="auto-style13"><asp:Label runat="server" ID="NonMod" CssClass="auto-style1"></asp:Label></td>
            <td align="center" class="auto-style13"><asp:Label runat="server" ID="Mod" CssClass="auto-style1"></asp:Label></td>
             <td align="center" class="auto-style13"><asp:Label runat="server" ID="SignImage" CssClass="auto-style1"></asp:Label></td>
            <td align="center" class="auto-style13"><asp:Label runat="server" ID="Photo" CssClass="auto-style1"></asp:Label></td>
            <td align="center" class="auto-style13"><asp:Label runat="server" ID="HomeAddress" CssClass="auto-style1"></asp:Label></td>
            <td align="center" class="auto-style13"><asp:Label runat="server" ID="WorkAddress" CssClass="auto-style1"></asp:Label></td>
        </tr>
    </table>--%>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="Req_ID" ErrorMessage="Please insert Order number">Please insert Order number</asp:RequiredFieldValidator>
    <br/>
    <div id="left_column">
        <input type="button" class="submitButton" value="Read Public Data" onclick="doReadPublicData();" />
    <asp:Button ID="Button2" runat="server" Text="Verify and Parse"
            CssClass="submitButton" OnClick="btnVerifyPubData_Click" />
    <asp:Button ID="Button3" PostBackUrl="http://zf-sp/orgchart/ProgramsDepartment/hajj/Lists/List21/AllItems.aspx" runat="server" Text="Next" Width="130px" />
    </div>
    <br />
    
</asp:Content>

<asp:Content ID="PageTitle" ContentPlaceHolderID="PlaceHolderPageTitle" runat="server">
طلب حج جديد
</asp:Content>

<asp:Content ID="PageTitleInTitleArea" ContentPlaceHolderID="PlaceHolderPageTitleInTitleArea" runat="server" >
طلب حج جديد
</asp:Content>
