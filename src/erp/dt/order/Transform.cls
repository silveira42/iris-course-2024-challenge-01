Class erp.dt.order.Transform Extends Ens.DataTransform
{

ClassMethod Transform(pSource As %Library.RegisteredObject, Output pTarget As erp.obj.Order) As %Library.Status
{
	Set order = ##class(erp.obj.Order).%New()

	Set order.OrderId = pSource."order_id"
	Set order.CustomerId = pSource."customer_id"
	Set order.Status = pSource.status
	Set order.TotalValue = pSource.price

	Set product = ##class(erp.obj.Product).%New()
	Set product.ProductId = pSource."product_id"
	Set product.Price = pSource.price
	Set product.Quantity = 1

	Do order.Products.Insert(product)

	Set pTarget = order

	Return $$$OK
}

}
