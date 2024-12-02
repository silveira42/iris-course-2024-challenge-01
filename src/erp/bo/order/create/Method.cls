Include Ensemble

Class erp.bo.order.create.Method [ Abstract ]
{

ClassMethod Execute(pHost As erp.bo.order.Operation, pRequest As erp.bo.order.create.Request, Output pResponse As erp.bo.order.create.Response) As %Library.Status
{
    Try
    {
        $$$ThrowOnError(pRequest.NewResponse(.pResponse))
    }
    Catch (exception)
    {
        Return exception.AsStatus()
    }

    // Montar request REST
    Set httpRequest = ##class(%Net.HttpRequest).%New()

    Set httpRequest.ContentCharset = "utf-8"
    Set httpRequest.ContentType = "application/json"

    Try
    {
        $$$ThrowOnError(pRequest.Order.%JSONExportToString(.httpRequestBody))    
    }
    Catch (exception)
    {
        Return exception.AsStatus()
    }

    Set url = "http://localhost:8080/api/order"

    // Enviar request REST
    Try
    {
        $$$ThrowOnError(pHost.Adapter.SendFormDataArray(.httpResponse, "POST", httpRequest, , httpRequestBody, url))    
    }
    Catch (exception)
    {
        Return exception.AsStatus()
    }

    // Validar retorno
    If (httpResponse.StatusCode '= 201)
    {
        Return $$$ERROR($$$GeneralError, "Erro ao criar pedido")
    }

    Return $$$OK
}

}
