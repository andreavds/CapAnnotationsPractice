using { db.Country as app } from '../db/schema';

service CatalogService @(path: '/catalogservice'){

   
    entity Country as projection on app.Country;
    entity Currencies as projection on app.Currencies;

}
