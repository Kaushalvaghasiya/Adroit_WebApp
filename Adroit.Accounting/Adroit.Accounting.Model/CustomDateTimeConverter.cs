//-----------------------------------------------------------------------
//    Copyright (c) Adroit IBS Pvt Ltd. All rights reserved.
//-----------------------------------------------------------------------
namespace Adroit.Accounting.Model
{
    using System.Diagnostics;
    using System.Text.Json;
    using System.Text.Json.Serialization;
    
    public class CustomDateTimeConverter : JsonConverter<DateTime>
    {
        public override DateTime Read(ref Utf8JsonReader reader, Type typeToConvert, JsonSerializerOptions options)
        {
            Debug.Assert(typeToConvert == typeof(DateTime));

            var str = reader.GetString();
            if (string.IsNullOrWhiteSpace(str))
            {
                return DateTime.Now;
            }

            return DateTime.Parse(reader.GetString());
        }

        public override void Write(Utf8JsonWriter writer, DateTime value, JsonSerializerOptions options)
        {
            writer.WriteStringValue(value.ToUniversalTime().ToString("yyyy'-'MM'-'dd'T'HH':'mm':'ssZ") ?? "");
        }
    }
    public class CustomNullableDateTimeConverter : JsonConverter<DateTime?>
    {
        public override DateTime? Read(ref Utf8JsonReader reader, Type typeToConvert, JsonSerializerOptions options)
        {
            Debug.Assert(typeToConvert == typeof(DateTime));

            var str = reader.GetString();
            if (string.IsNullOrWhiteSpace(str))
            {
                return null;
            }

            return DateTime.Parse(reader.GetString());
        }

        public override void Write(Utf8JsonWriter writer, DateTime? value, JsonSerializerOptions options)
        {
            writer.WriteStringValue(value?.ToUniversalTime().ToString("yyyy'-'MM'-'dd'T'HH':'mm':'ssZ") ?? "");
        }
    }

}