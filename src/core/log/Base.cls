Class core.log.Base Extends %Library.Persistent [ Abstract ]
{

Property CreatedAt As %Library.TimeStamp;

Property Payload As %Library.String;

ClassMethod Create(pPayload As %Library.String) As core.log.Base
{
    Set newLog = ##class(core.log.Base).%New()
    Set newLog.Payload = pPayload
    $$$ThrowOnError(newLog.%Save())

    Return newLog
}

ClassMethod ReadByDate(pDateTime As %Library.TimeStamp) As %Collection.ListOfObj
{
    Set sqlContext = ##Class(%SQL.Statement).%ExecDirect(,"CALL core_log.Base_SelectByDateGreaterEqual(?)", pDateTime)

    Set bases = ##class(%Collection.ListOfObj).%New()

    While (sqlContext.%Next(.statusCode))
    {
        If ($SYSTEM.Status.IsError(statusCode))
        {
            Throw ##Class(%Exception.StatusException).CreateFromStatus(statusCode)
        }

        Set base = ##class(core.log.Base).%OpenId(sqlContext.%ID())

        Do bases.Insert(base)
    }
}

/// Description
Query SelectByDateGreaterEqual(pDateTime As %Library.TimeStamp) As %Library.SQLQuery [ SqlProc ]
{
    SELECT Id, CreatedAt, Payload
    FROM core_log.Base
    WHERE CreatedAt >= :pDateTime
    ORDER BY CreatedAt ASC
}

Storage Default
{
<Data name="BaseDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>CreatedAt</Value>
</Value>
<Value name="3">
<Value>Payload</Value>
</Value>
</Data>
<DataLocation>^core.log.BaseD</DataLocation>
<DefaultData>BaseDefaultData</DefaultData>
<IdLocation>^core.log.BaseD</IdLocation>
<IndexLocation>^core.log.BaseI</IndexLocation>
<StreamLocation>^core.log.BaseS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
