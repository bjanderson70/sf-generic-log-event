/**
 * @File Name          : accc_MetadataJSON2ApexClass.cls
 * @Description        :  Generated by JSON2Apex http://json2apex.herokuapp.com/
 *                        The supplied json has fields with names that are not valid in apex
 *                        and so can only be parsed with explicitly generated code, this option
 *                        was auto selected for you.
 * @Group              : Generic Log Event
 * @Last Modified On   : 1/26/2020, 11:17:12 AM
 * @Modification Log   :
 * Ver       Date            Author                 Modification
 * 1.0    9/6/2019    Bill Anderson      Initial Version
 **/
//
// Generated by JSON2Apex http://json2apex.herokuapp.com/
//
// The supplied json has fields with names that are not valid in apex
// and so can only be parsed with explicitly generated code, this option
// was auto selected for you.

public class accc_MetadataJSON2ApexClass {

    public class Field {
        public String name {get; set;}
        public String api {get; set;}
        public String type_Z {get; set;} // in json: type

        public Field(JSONParser parser) {
            while (parser.nextToken() != System.JSONToken.END_OBJECT) {
                if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
                    String text = parser.getText();
                    if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                        if (text == 'name') {
                            name = parser.getText();
                        } else if (text == 'api') {
                            api = parser.getText();
                        } else if (text == 'type') {
                            type_Z = parser.getText();
                        } else {
                            accc_ApexUtilities.log( 'Field consuming unrecognized property: '+text);
                            consumeObject(parser);
                        }
                    }
                }
            }
        }
    }

    public class Fields {
        public String sobjectName {get; set;}
        public List<Field> field {get; set;}

        public Fields(JSONParser parser) {
            while (parser.nextToken() != System.JSONToken.END_OBJECT) {
                if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
                    String text = parser.getText();
                    if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                        if (text == 'sobjectName') {
                            sobjectName = parser.getText();
                        } else if (text == 'field') {
                            field = arrayOfField(parser);
                        } else {
                            accc_ApexUtilities.log( 'Fields consuming unrecognized property: '+text);
                            consumeObject(parser);
                        }
                    }
                }
            }
        }
    }

    public class Payload {
        public List<Fields> fields {get; set;}

        public Payload(JSONParser parser) {
            while (parser.nextToken() != System.JSONToken.END_OBJECT) {
                if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
                    String text = parser.getText();
                    if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                        if (text == 'fields') {
                            fields = arrayOfFields(parser);
                        } else {
                            accc_ApexUtilities.log( 'Payload consuming unrecognized property: '+text);
                            consumeObject(parser);
                        }
                    }
                }
            }
        }
    }

    public class accc_MetadataClass {
        public String logName {get; set;}
        public String version {get; set;}
        public String domain {get; set;}
        public Payload payload {get; set;}

        public accc_MetadataClass(JSONParser parser) {
            while (parser.nextToken() != System.JSONToken.END_OBJECT) {
                if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
                    String text = parser.getText();
                    if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                        if (text == 'logName') {
                            logName = parser.getText();
                        } else if (text == 'version') {
                            version = parser.getText();
                        } else if (text == 'domain') {
                            domain = parser.getText();
                        } else if (text == 'payload') {
                            payload = new Payload(parser);
                        } else {
                            accc_ApexUtilities.log( 'accc_MetadataClass consuming unrecognized property: '+text);
                            consumeObject(parser);
                        }
                    }
                }
            }
        }
    }


    public static accc_MetadataClass parse(String json) {
        System.JSONParser parser = System.JSON.createParser(json);
        return new accc_MetadataClass(parser);
    }

    public static void consumeObject(System.JSONParser parser) {
        Integer depth = 0;
        do {
            System.JSONToken curr = parser.getCurrentToken();
            if (curr == System.JSONToken.START_OBJECT ||
                curr == System.JSONToken.START_ARRAY) {
                depth++;
            } else if (curr == System.JSONToken.END_OBJECT ||
                       curr == System.JSONToken.END_ARRAY) {
                depth--;
            }
        } while (depth > 0 && parser.nextToken() != null);
    }

    private static List<Field> arrayOfField(System.JSONParser p) {
        List<Field> res = new List<Field>();
        if (p.getCurrentToken() == null) p.nextToken();
        while (p.nextToken() != System.JSONToken.END_ARRAY) {
            res.add(new Field(p));
        }
        return res;
    }

    private static List<Fields> arrayOfFields(System.JSONParser p) {
        List<Fields> res = new List<Fields>();
        if (p.getCurrentToken() == null) p.nextToken();
        while (p.nextToken() != System.JSONToken.END_ARRAY) {
            res.add(new Fields(p));
        }
        return res;
    }
}