package beans;
//Added additional fields to this bean, but still needs url file directory link holder
public class Candy {
	String name;
	String description;
	String imageURL;
	float price;
	Integer quantity;
	Integer product_id;
	Integer inventory_id;
	Integer inventory_quantity;
	Integer order_id;
	Integer ordered_quantity;
	
	public Candy() {
		name = "";
		description = "";
		quantity = 0;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getName() {
		return name;
	}
	
	public void setImageURL(String imageURL) {
		this.imageURL = imageURL;
	}

	public String getImageURL() {
		return imageURL;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getDescription() {
		return this.description;
	}

	public void setProductID(Integer product_id) {
		this.product_id = product_id;
	}

	public Integer getProductID() {
		return this.product_id;
	}

	public void setInventoryID(Integer inventory_id) {
		this.inventory_id = inventory_id;
	}

	public Integer getInventoryID() {
		return this.inventory_id;
	}

	public void setOrderID(Integer order_id) {
		this.order_id = order_id;
	}

	public Integer getOrderID() {
		return this.order_id;
	}

	public void setPrice(float price) {
		this.price = price;
	}

	public float getPrice() {
		return this.price;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public Integer getQuantity() {
		return this.quantity;
	}
	
	public void setInventoryQuantity(Integer inventory_quantity) {
		this.inventory_quantity = inventory_quantity;
	}

	public Integer getInventoryQuantity() {
		return this.inventory_quantity;
	}

}
