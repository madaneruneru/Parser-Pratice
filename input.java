class input
{
	public static void main(String[] arg)
	{
		int x, y;
		for(x = 1; x <= 9; x = x + 1)
		{
			for(y = 1; y <= 9; y = y + 1)
			{
				System.out.print(x);
				System.out.print("*");
				System.out.print(y);
				System.out.print("=");
				System.out.print(x * y);
			}
		}
	}
}