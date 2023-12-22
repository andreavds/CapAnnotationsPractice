namespace db.Country;
using { cuid } from '@sap/cds/common';



entity Country : cuid {
    country: String;
    ISO2: String;
    ISO3: String;
    to_Currencies: Composition of many Currencies on to_Currencies.to_Country = $self;
}

entity Currencies : cuid {
    currency: String ;
    code: String;
    to_Country : Association to Country;
}



