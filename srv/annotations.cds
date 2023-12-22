using { db.Country as app } from './service';


annotate app.Country with {
    country @title : 'Country' @readonly;
    ISO2 @title : 'ISO2' @readonly;
    ISO3 @title : 'ISO3' @readonly;
};

annotate app.Currencies with {
    currency @title : 'Country';
    code @title : 'Code' @readonly;
}; 





annotate app.Country with @odata.draft.enabled @(
    


    UI: {
        CreateHidden: true,
        DeleteHidden : true,

        HeaderInfo : {
            $Type : 'UI.HeaderInfoType',
            TypeName : 'Country',
            TypeNamePlural : 'Countries',
            Title : {
                $Type : 'UI.DataField',
                Value : country,
            },
        },
        FieldGroup  : {
            $Type : 'UI.FieldGroupType',
            Data : [
                {
                    $Type : 'UI.DataField',
                    Value : country ,
                },
                {
                    $Type : 'UI.DataField',
                    Value : ISO2,
                },
                {
                    $Type : 'UI.DataField',
                    Value : ISO3,
                },
            ],
        },

        SelectionFields : [
            country, ISO2, ISO3
        ],

        LineItem : [
            {
                $Type : 'UI.DataField',
                Value : country,
            },
            {
                $Type : 'UI.DataField',
                Value : ISO2,
            },
            {
                $Type : 'UI.DataField',
                Value : ISO3,
            },
        ],

        

        Facets : [
            {
                $Type : 'UI.ReferenceFacet',
                Target : '@UI.FieldGroup',
            },
            {
                $Type : 'UI.ReferenceFacet',
                Target : 'to_Currencies/@UI.LineItem',
            },
        ],
    }
);



annotate app.Currencies with {
    currency @(Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Currencies',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : currency,
                    ValueListProperty : 'currency',
                },
            ],
           
        },
        Common.ValueListWithFixedValues : true
)};

annotate app.Currencies with @(

    
Common  : {SideEffects #QuantityChanged: {
        SourceProperties: ['currency'],
        TargetProperties: ['code']
    }},


    UI : {
        
        LineItem  : [
            {
                $Type : 'UI.DataField',
                Value : currency,
            },
            {
                $Type : 'UI.DataField',
                Value : code,
            },
        ],
    }

);


