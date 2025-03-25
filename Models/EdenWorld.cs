using System.Drawing;
using System.Reflection.Metadata.Ecma335;

namespace EdenWorldTools.Models {
    public class EdenWorld {
        public Dictionary<int, Point>? Chunks { get; set; }
        public Rectangle Area { get; set; }
        public int SkyColor { get; set; }
        public byte[]? WorldData { get; set; }

        private string? edenFileName;
        private string? edenFileNameSuffix;
        private string? worldName;
        private DateTime createDate;



        public string EdenFileName {
            get {
                return $"{edenFileName}.{edenFileNameSuffix}";
            }
            set {
                string[] parts = value.Split(['.']);
                if (parts.Length != 2) {
                    throw new ArgumentException("EdenFileName must be in the format 'edenfilename.suffix'");
                }
                edenFileName = parts[0];
                edenFileNameSuffix = parts[1];

                createDate = CalculateCreateDate(long.Parse(edenFileName));

            }
        }
        public string WorldName { get => worldName; set => worldName = value; }

        public DateTime CreateDate {
            get {
                return createDate;
            }
            set {
                createDate = value;
            }
        }

        public DateTime CalculateCreateDate(long time) {
            createDate = new DateTime(1970, 1, 1, 0, 0, 0, DateTimeKind.Utc).AddSeconds(time);
            return createDate;
        }
    }
}
