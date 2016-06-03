using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Metal_Archives;
using Metal_Archives.Models;

namespace Metal_Archives.Controllers
{
    public class DatabaseController : Database
    {
        #region Band
        public List<object> GetAllBands()
        {
            List<string> Columns = new List<string>();
            Columns.Add("Bandname");
            Columns.Add("Origin");
            Columns.Add("Status");
            Columns.Add("Formed");
            Columns.Add("Description");
            Columns.Add("Logo");
            List<object> Bands = ReadObjects("tblBand",Columns,"Band");
            foreach (BandModel bm in Bands)
            {
                Dictionary<string, string> data = new Dictionary<string, string>();
                data.Add("tblGenre", "Tables");
                data.Add("tblGenreLine","Tables");
                data.Add("tblBand","Tables");
                data.Add("genrenr","JoinOn");
                data.Add("bandnr","JoinOn");
                data.Add("Genrename","Columns");
                List<string> genres = ReadWithJoinCondition(2, data, "C.Bandname", bm.Name);

                foreach (string genre in genres)
                {
                    if (genres.LastOrDefault() == genre)
                    {
                        bm.Genre += genre;
                    }
                    else bm.Genre += genre +"/";
                }
            }
            return Bands;
        }
        public BandModel GetBand(string bandname)
        {
            List<string> Columns = new List<string>();
            Columns.Add("Bandname");
            Columns.Add("Origin");
            Columns.Add("Status");
            Columns.Add("Formed");
            Columns.Add("Description");
            Columns.Add("Logo");
            BandModel Band = (BandModel)ReadObjectWithCondition("tblBand", Columns,"Bandname", bandname,"Band");

            Dictionary<string, string> data = new Dictionary<string, string>();
            data.Add("tblGenre", "Tables");
            data.Add("tblGenreLine", "Tables");
            data.Add("tblBand", "Tables");
            data.Add("genrenr", "JoinOn");
            data.Add("bandnr", "JoinOn");
            data.Add("Genrename", "Columns");
            List<string> genres = ReadWithJoinCondition(2, data, "C.Bandname", Band.Name);

            foreach (string genre in genres)
            {
                if (genres.LastOrDefault() == genre)
                {
                    Band.Genre += genre;
                }
                else { Band.Genre += genre + "/"; }
            }
            foreach (AlbumModel a in GetAlbums(Band.Name))
            {
                Band.Albums.Add(a);
            }

                return Band;
        }
        #endregion
        #region Album
        public List<object> GetAlbums(string bandname)
        {
            List<string> Columns = new List<string>();
            Columns.Add("Albumname");
            Columns.Add("AlbumType");
            Columns.Add("ReleaseDate");
            List<object> Albums = ReadObjects("tblAlbum", Columns,"Bandnr",ReadStringWithCondition("tblBand","Bandnr","BandName",bandname),"Album");
            return Albums;
        }
        #endregion
    }
}