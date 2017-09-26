﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SenseNet.Search.Parser;

namespace SenseNet.Search
{
    public enum IndexableDataType { String, Int, Long, Float, Double }

    public class QueryFieldValue //UNDONE:!! After LINQ: do not use in parser / compiler
    {
        internal bool IsPhrase { get; private set; }
        internal CqlLexer.Token Token { get; private set; }
        internal double? FuzzyValue { get; set; }
        public string StringValue { get; private set; }
        public object InputObject { get; private set; }

        public IndexableDataType Datatype { get; private set; }
        public Int32 IntValue { get; private set; }
        public Int64 LongValue { get; private set; }
        public Single SingleValue { get; private set; }
        public Double DoubleValue { get; private set; }

        public QueryFieldValue(object value)
        {
            InputObject = value;
        }

        internal QueryFieldValue(string stringValue, CqlLexer.Token token, bool isPhrase)
        {
            Datatype = IndexableDataType.String;
            StringValue = stringValue;
            Token = token;
            IsPhrase = isPhrase;
        }

        public void Set(Int32 value)
        {
            Datatype = IndexableDataType.Int;
            IntValue = value;
        }
        public void Set(Int64 value)
        {
            Datatype = IndexableDataType.Long;
            LongValue = value;
        }
        public void Set(Single value)
        {
            Datatype = IndexableDataType.Float;
            SingleValue = value;
        }
        public void Set(Double value)
        {
            Datatype = IndexableDataType.Double;
            DoubleValue = value;
        }
        public void Set(String value)
        {
            Datatype = IndexableDataType.String;
            StringValue = value;
        }

        public override string ToString()
        {
            return String.Concat(Token, ":", StringValue, FuzzyValue == null ? "" : ":" + FuzzyValue);
        }
    }

    public class QueryCompilerValue
    {
        public string StringValue { get; private set; }

        public IndexableDataType Datatype { get; private set; }
        public int IntValue { get; private set; }
        public long LongValue { get; private set; }
        public float SingleValue { get; private set; }
        public double DoubleValue { get; private set; }

        public QueryCompilerValue(string text)
        {
            Datatype = IndexableDataType.String;
            StringValue = text;
        }

        public void Set(int value)
        {
            Datatype = IndexableDataType.Int;
            IntValue = value;
        }
        public void Set(long value)
        {
            Datatype = IndexableDataType.Long;
            LongValue = value;
        }
        public void Set(float value)
        {
            Datatype = IndexableDataType.Float;
            SingleValue = value;
        }
        public void Set(double value)
        {
            Datatype = IndexableDataType.Double;
            DoubleValue = value;
        }
        public void Set(string value)
        {
            Datatype = IndexableDataType.String;
            StringValue = value;
        }

        public override string ToString()
        {
            return $"{StringValue} ({Datatype})";
        }
    }

}
