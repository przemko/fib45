public class fib {

	public static int rekfib(int n) {
		if(n < 2) {
			return 1;
		}
		return rekfib(n-1)+rekfib(n-2);
	}
	
	public static void main(String[] args){
		System.out.println(rekfib(45));
	}
}
