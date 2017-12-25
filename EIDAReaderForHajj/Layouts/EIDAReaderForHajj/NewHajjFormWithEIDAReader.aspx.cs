using EmiratesId.AE.PublicData;
using Microsoft.SharePoint.WebControls;
using System;

namespace EIDAReaderForHajj.Layouts.EIDAReaderForHajj
{
    public partial class NewHajjFormWithEIDAReader : LayoutsPageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnVerifyPubData_Click(object sender, EventArgs e)
        {
            #region Read Submitted EID Data

            string ef_idn_cn = Request.Params["ef_idn_cn"];
            string ef_non_mod_data = Request.Params["ef_non_mod_data"];
            string ef_mod_data = Request.Params["ef_mod_data"];
            string ef_sign_image = Request.Params["ef_sign_image"];
            string ef_photo = Request.Params["ef_photo"];
            string ef_root_cert = Request.Params["ef_root_cert"];
            string ef_home_address = Request.Params["ef_home_address"];
            string ef_work_address = Request.Params["ef_work_address"];

            string certsPath = Request.MapPath("~/data_signing_certs");

            bool nonMod = false;
            bool mod = false;
            bool signImage = false;
            bool photo = false;
            bool homeAddress = false;
            bool workAddress = false;

            PublicDataParser parser = null;

            parser = new PublicDataParser(ef_idn_cn, certsPath);
            nonMod = parser.parseNonModifiableData(ef_non_mod_data);
            mod = parser.parseModifiableData(ef_mod_data);
            photo = parser.parsePhotography(ef_photo);
            signImage = parser.parseSignatureImage(ef_sign_image);
            homeAddress = parser.parseHomeAddressData(ef_home_address);
            workAddress = parser.parseWorkAddressData(ef_work_address);
            parser.parseRootCertificate(ef_root_cert);

            //NonMod.Text = nonMod.ToString();
            //Mod.Text = mod.ToString();
            //SignImage.Text = "".Equals(ef_sign_image) ? "N/A" : signImage.ToString();
            //Photo.Text = "".Equals(ef_photo) ? "N/A" : photo.ToString();
            //HomeAddress.Text = "".Equals(ef_home_address) ? "N/A" : homeAddress.ToString();
            //WorkAddress.Text = "".Equals(ef_work_address) ? "N/A" : workAddress.ToString();

            FullName.Text = parser.getFullName();
            IDN.Text = parser.getIdNumber();
            CardNumber.Text = parser.getCardNumber();
            lblTitle.Text = parser.getTitle();
            Nationality.Text = parser.getNationality();
            IssueDate.Text = parser.getIssueDate().Value.ToString("dd/MM/yyyy");
            ExpiryDate.Text = parser.getExpiryDate().Value.ToString("dd/MM/yyyy");

            IdType.Text = parser.getIdType();
            Sex.Text = parser.getSex();
            DoB.Text = parser.getDateOfBirth() == null ? "" : parser.getDateOfBirth().Value.ToString("dd/MM/yyyy");
            FullName_ar.Text = parser.getArabicFullName();
            MaritalStatus.Text = parser.getMaritalStatus();
            Occupation.Text = parser.getOccupation() == null ? "" : parser.getOccupation();
            OccupationField.Text = parser.getOccupationField() == null ? "" : parser.getOccupationField();
            Title_ar.Text = parser.getArabicTitle();
            Nationality_ar.Text = parser.getArabicNationality();
            MotherName.Text = parser.getMotherFullName() == null ? "" : parser.getMotherFullName();
            MotherName_ar.Text = parser.getMotherFullName_ar() == null ? "" : parser.getMotherFullName_ar();
            FamilyId.Text = parser.getFamilyID();
            HusbandIDN.Text = parser.getHusbandIDN();
            SponsorType.Text = parser.getSponsorType();
            SponsorName.Text = parser.getSponsorName();
            SponsorUnifiedNumber.Text = parser.getSponsorUnifiedNumber();
            ResidencyType.Text = parser.getResidencyType();
            ResidencyNumber.Text = parser.getResidencyNumber();
            ResidencyExpiryDate.Text = parser.getResidencyExpiryDate() == null ? "" : parser.getResidencyExpiryDate().Value.ToString("dd/MM/yyyy");

            if (parser.getPhotography() != null)
                PhotoBase64.Src = "data:image/jpeg;base64," + Convert.ToBase64String(parser.getPhotography());
            if (parser.getHolderSignatureImage() != null)
                SignaturePhotoBase64.Src = "data:image/tiff;base64," + Convert.ToBase64String(parser.getHolderSignatureImage());

            #endregion Read Submitted EID Data

            #region Fill Data To an instance of EIDData Class

            EIDData userData = new EIDData();
            userData.CardNumber = CardNumber.Text;
            userData.DoB = DoB.Text;
            userData.ExpiryDate = ExpiryDate.Text;
            userData.FamilyId = FamilyId.Text;

            #endregion Fill Data To an instance of EIDData Class

            #region Save Data From EIDData to SharePoint List

            //using (SPSite site = new SPSite("Hajj url"))//Get the Site
            //using (SPWeb web = site.OpenWeb())//Get the Subsite
            //{
            //    web.AllowUnsafeUpdates = true;

            //    //Get the List
            //    SPList hajjList = web.Lists["ListName"];

            //    //Create Empty Item
            //    SPListItem newHajjItem = hajjList.Items.Add();

            //    //Fill Item Data
            //    newHajjItem["Field1InternalName"] = userData.CardNumber;
            //    newHajjItem["Field2InternalName"] = userData.DoB;
            //    newHajjItem["Field3InternalName"] = userData.ExpiryDate;
            //    newHajjItem["Field4InternalName"] = userData.FamilyId;

            //    //Save changes to SharePoint
            //    newHajjItem.SaveChanges();

            //    web.AllowUnsafeUpdates = false;

            #endregion Fill Data To an instance of EIDData Class
        }
    }
}