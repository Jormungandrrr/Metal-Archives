using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Metal_Archives;
using Metal_Archives.Models;
using Metal_Archives.Database;

namespace Metal_Archives.Database
{
    public class BandDB : Database
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
            foreach (AlbumModel a in GetAlbumsByBand(Band.Name))
            {
                Band.Albums.Add(a);
            }
            foreach (ArtistModel a in GetArtistByBand(Band.Name))
            {
                Band.Members.Add(a);
            }

            return Band;
        }

        public void InsertBand(BandModel Band)
        {
            Dictionary<string, string> values = new Dictionary<string, string>();
            values.Add("BandName", Band.Name);
            values.Add("Origin", Band.Origin);
            values.Add("Place", Band.Place);
            values.Add("Status", Band.Status);
            values.Add("Description", Band.Description);
            values.Add("Formed", Band.Formed.ToString());
            values.Add("YearsActive", Band.Formed.ToString());
            Insert("ADRES", values);
        }
        #endregion
        #region Album
        public List<object> GetAlbumsByBand(string bandname)
        {
            List<string> Columns = new List<string>();
            Columns.Add("Albumname");
            Columns.Add("AlbumType");
            Columns.Add("ReleaseDate");
            List<object> Albums = ReadObjects("tblAlbum", Columns,"Bandnr",ReadStringWithCondition("tblBand","Bandnr","BandName",bandname),"Album");
            return Albums;
        }
        #endregion

        #region Artist
        public List<object> GetArtistByBand(string bandname)
        {
            List<string> Columns = new List<string>();
            Columns.Add("Stagename");
            Columns.Add("FullName");
            Columns.Add("Age");
            Columns.Add("Birthdate");
            Columns.Add("Origin");
            Columns.Add("biography");
            Columns.Add("Trivia");
            List<object> Artists = ReadObjects("tblArtist", Columns, "Artistnr", ReadStringWithCondition("tblLineUp", "Artistnr", "Bandnr", ReadStringWithCondition("tblBand","Bandnr","Bandname",bandname)), "Artist");
            return Artists;
        }
        #endregion
    }
}