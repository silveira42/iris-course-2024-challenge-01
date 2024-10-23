Include Ensemble

Class core.bo.payment.create.Method [ Abstract ]
{

ClassMethod Execute(pHost As core.bo.payment.Operation, pRequest As core.bo.payment.create.Request, Output pResponse As core.bo.payment.create.Response) As %Library.Status
{
    Try {
        Do pRequest.NewResponse(.pResponse)
    } Catch (exception) {
        $$$LOGERROR("Error generating response at create method: " _ exception.DisplayString())
        Return exception.AsStatus()
    }

    Try {
        Set paymentLog = ##class(core.log.Payment).Create(pRequest.Payload)
    } Catch (exception) {
        Return exception.AsStatus()
    }

    Set paymentObj = ##class(core.obj.Payment).%New()
    Set paymentObj.Payload = paymentLog.Payload
    Set paymentObj.CreatedAt = paymentLog.CratedAt

    Set pResponse.Payment = paymentObj

    Return $$$OK
}

}
