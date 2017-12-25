using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.HtmlControls;

namespace EIDAReaderForHajj.Layouts.EIDAReaderForHajj
{
    public class EIDData
    {
        public string NonMod { get; set; }

        public string Mod { get; set; }

        public string SignImage { get; set; }

        public string Photo { get; set; }

        public string HomeAddress { get; set; }

        public string WorkAddress { get; set; }

        public string FullName { get; set; }

        public string IDN { get; set; }

        public string MotherName { get; set; }

        public string FullName_ar { get; set; }

        public string CardNumber { get; set; }

        public string MotherName_ar { get; set; }

        public string Title { get; set; }

        public string Nationality { get; set; }

        public string FamilyId { get; set; }

        public string Title_ar { get; set; }

        public string Nationality_ar { get; set; }

        public string IssueDate { get; set; }

        public string Sex { get; set; }

        public string SponsorType { get; set; }

        public string ExpiryDate { get; set; }

        public string DoB { get; set; }

        public string SponsorName { get; set; }

        public string MaritalStatus { get; set; }

        public string HusbandIDN { get; set; }

        public string SponsorUnifiedNumber { get; set; }

        public string ResidencyType { get; set; }

        public string ResidencyNumber { get; set; }

        public string ResidencyExpiryDate { get; set; }

        public string IdType { get; set; }

        public string Occupation { get; set; }

        public string OccupationField { get; set; }

        HtmlImage PhotoBase64 { get; set; }
        
        HtmlImage SignaturePhotoBase64 { get; set; }
    }
}