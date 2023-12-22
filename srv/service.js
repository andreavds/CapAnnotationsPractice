
const cds = require('@sap/cds');


module.exports = (srv) => {

const {Currencies} = cds.entities


srv.before('READ', 'CatalogService.Currencies.drafts', async (req) => {
     console.log("Pase por aqui");

    if (req.data.currency != undefined) {


      let nombreMoneda = req.data.currency;


      // Realizar un lookup para obtener el código de la moneda
      const codigoMoneda = await cds.transaction(req).run(
        SELECT.one.from(Currencies).where({ currency: nombreMoneda }).columns('code')
      );

      if (codigoMoneda != undefined) {

        // Actualizar el registro existente con el nuevo valor del código de moneda
        await cds.transaction(req).run(
          UPDATE('CatalogService.Currencies.drafts')
            .set({ code: codigoMoneda.code })
            .where({ currency: nombreMoneda })
        );

      }


    }

  });


}