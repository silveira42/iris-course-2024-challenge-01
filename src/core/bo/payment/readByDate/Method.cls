Include Ensemble

Class core.bo.payment.readByDate.Method [ Abstract ]
{

ClassMethod Execute(pHost As core.bo.payment.Operation, pRequest As core.bo.payment.readByDate.Request, Output pResponse As core.bo.payment.readByDate.Response) As %Library.Status
{
    Try {
        Do pRequest.NewResponse(.pResponse)
    } Catch (exception) {
        $$$LOGERROR("Error generating response at readByDate method: " _ exception.DisplayString())
        Return exception.AsStatus()
    }
    
    Try {
        Set paymentLogs = ##class(core.log.Payment).ReadByDate(pRequest.DateTime)
    } Catch (exception) {
        Return exception.AsStatus()
    }

    Set paymentObjs = ##class(%Collection.ListOfObj).%New()

    For i=0:1:paymentLogs.Count()
    {
        Set paymentLog = paymentLogs.GetAt(i)

        Set paymentObj = ##class(core.obj.Payment).%New()
        Set paymentObj.Payload = paymentLog.Payload
        Set paymentObj.CreatedAt = paymentLog.CratedAt

        Do paymentObjs.Insert(paymentObj)
    }

    Set pResponse.Payments = paymentObjs

    Return $$$OK
}

}
